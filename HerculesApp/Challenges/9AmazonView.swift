//
//  AmazonView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI
import Combine

private struct FramePreferenceKey: PreferenceKey {
    
    static var defaultValue: [String: CGRect] = [:]
    static func reduce(value: inout [String: CGRect], nextValue: () -> [String: CGRect]) { value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct AmazonView: View {
    
    @State private var xOffset: CGFloat = 0.0
    @State private var OffsetY: CGFloat = -1000
    @State private var offsety: CGFloat = -1000
    @State private var Offsety: CGFloat = -1000
    @State private var enemy1Frame: CGRect = .zero
    @State private var enemy2Frame: CGRect = .zero
    @State private var enemy3Frame: CGRect = .zero
    @State private var StickmanFrame: CGRect = .zero
    @State private var isGameOver: Bool = false
    @State var timeRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image("Grass")
                .brightness(-0.15)
            
            VStack {
                ZStack {
                    
                    
                    HStack {
                        
                        Image("Amazon")
                            .resizable()
                            .frame(width: 80, height:160)
        
                            .onAppear{
                                withAnimation(.linear (duration: 2).repeatForever(autoreverses: false)) {
                                    
                                    OffsetY = 600
                                }
                            }
                            .offset(x: -40, y: OffsetY)
                            .background(
                                GeometryReader { geo in Color.clear
                                        .preference(key: FramePreferenceKey.self, value:["enemy1":geo.frame(in: .global)])
                                    
                                }
                                
                            )
                        
                        
                        
                        
                        Image("Amazon1")
                            .resizable()
                            .frame(width: 80, height:160)
                            .offset(x:0, y: offsety)
                            .onAppear{
                                withAnimation(.linear (duration: 3).repeatForever(autoreverses: false)) {
                                    
                                    offsety = 600
                                }
                            }
                            .background(
                                GeometryReader { geo in Color.clear
                                        .preference(key: FramePreferenceKey.self, value:["enemy2":geo.frame(in: .global)])
                                    
                                }
                                
                            )
                        
                        
                        Image("Amazon2")
                            .resizable()
                            .frame(width: 80, height:160)
                            .offset(x: 30, y: Offsety)
                            .onAppear{
                                withAnimation(.linear (duration: 6).repeatForever(autoreverses: false)) {
                                    
                                    Offsety = 600
                                }
                            }
                            .background(
                                GeometryReader { geo in Color.clear
                                        .preference(key: FramePreferenceKey.self, value:["enemy3":geo.frame(in: .global)])
                                    
                                }
                                
                            )
                    }
                    Image("Stickmanbelt")
                        .resizable()
                        .brightness(0.2)
                        .frame(width:50, height:110)
                        .offset(x: xOffset)
                        .background(
                            GeometryReader { geo in Color.clear
                                    .preference(key: FramePreferenceKey.self, value:["player":geo.frame(in: .global)])
                                
                            }
                            
                        )
                    
                    if isGameOver == true {
                        ZStack {
                            
                            Color.white.opacity(0.85)
                                .ignoresSafeArea()
                                .transition(.opacity)
                                .zIndex(1)
                            
                            Text("Game over")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(.red)
                                .transition(.scale)
                                .zIndex(2)
                            
                            Button("Restart"){
                             restartGame()
                            }
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .bold()
                            .font(.title3)
                            .offset(x:0, y:300)
                            .zIndex(2)
                            
                        }
                        
                    }
                    
                }
                
                .onPreferenceChange(FramePreferenceKey.self) { frames in
                    if let e1 = frames["enemy1"] { enemy1Frame = e1 }
                    if let e2 = frames["enemy2"] { enemy2Frame = e2 }
                    if let e3 = frames["enemy3"] { enemy3Frame = e3 }
                    if let player = frames["player"] { StickmanFrame = player }
                    checkCollision()
                }

                
                HStack{
                    Spacer()
                    Button {
                        xOffset -= 130
                    } label: {
                        Image(systemName: "arrowshape.left.fill")
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Spacer()
                        
                        Button {
                            xOffset += 130
                        } label: {
                            Image(systemName: "arrowshape.right.fill")
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Spacer()
                }
                
                Text("\(timeRemaining)")
                    .foregroundColor(.white)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            
                            timeRemaining -= 1
                        }
                        
                    }
            }
        }
    }
    
    func restartGame() {
        isGameOver = false
        timeRemaining = 20
        
        Offsety = -1000
        OffsetY = -1000
        offsety = -1000
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.linear(duration: 2 ).repeatForever(autoreverses: false)) {
                OffsetY = 600
            }
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                        offsety = 600
                    }
                    withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)) {
                        Offsety = 600
                    }

        }
    }
    
    func checkCollision() {
        
        guard !isGameOver else {return}
        if enemy1Frame.intersects(StickmanFrame) ||
        enemy2Frame.intersects(StickmanFrame) ||
            enemy3Frame.intersects(StickmanFrame) {
            isGameOver = true
        }
    }
}

#Preview {
    AmazonView()
}
