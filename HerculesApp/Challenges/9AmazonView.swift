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
                        Text("Game over")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        
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
                    Button("Left"){
                        xOffset -= 130
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Spacer()
                        
                        Button("Right") {
                            xOffset += 130
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
    
    func checkCollision() {
        if enemy1Frame.intersects(StickmanFrame) ||
        enemy2Frame.intersects(StickmanFrame) ||
            enemy3Frame.intersects(StickmanFrame) {
            
            if !isGameOver {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    if enemy1Frame.intersects(self.StickmanFrame) ||
                        enemy2Frame.intersects(self.StickmanFrame) ||
                        enemy3Frame.intersects(self.StickmanFrame) {
                        
                        isGameOver = true
                    }
                }
            }
        }
    }
}

#Preview {
    AmazonView()
}
