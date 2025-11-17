//
//  LionView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI
import Combine

struct LionView: View {
    @State private var yOffset: CGFloat = 0
    @State private var success: Bool = false
    @State private var arrowYPosition: CGFloat = 150
    @State private var arrowDirection: CGFloat = 1
    @State private var isShooting = false
    @State private var shotArrowXPosition: CGFloat = 120
    @State private var shotArrowOpacity: Double = 0
    @State private var hasWon: Bool = false
    
    let timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
    let greenZoneRange: ClosedRange<CGFloat> = 50...150
    let yellowZoneRange: ClosedRange<CGFloat> = 150...250
    let redZoneRange: ClosedRange<CGFloat> = 250...350
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("Grass")
                
                if hasWon {
                    ZStack {
                        Spacer()
                        WinView()
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    Text("Shoot the Nemean Lion!")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    Image("Lion")
                        .resizable()
                        .frame(width: 300, height:300)
                    
                    ZStack {
                        Image("Bow")
                            .resizable()
                            .frame(width: 250, height: 150)
                            .padding()
                        
                        
                        if !success {
                            Image("Pencil")
                                .resizable()
                                .frame(width: 120, height: 220)
                                .zIndex(1)
                            
                        }
                    }
                    
                    
                    HStack(alignment: .bottom, spacing: 0){
                        VStack (spacing:0) {
                            
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 60, height: 100)
                                    .border(Color.green.opacity(0.7), width: 3)
                                Text("GREEN")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            ZStack {
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: 60, height: 100)
                                    .border(Color.yellow.opacity(0.7), width: 3)
                                Text("YELLOW")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            ZStack {
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(width: 60, height: 100)
                                    .border(Color.red.opacity(0.7), width: 3)
                                Text("RED")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        
                        Image(systemName: "arrowshape.left.fill")
                            .offset(y: yOffset)
                            .foregroundStyle(.white)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true)) {
                                    yOffset = -100
                                }
                            }
                        if shotArrowOpacity > 0 {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    
                                    Image("Pencil")
                                        .resizable()
                                        .frame(width: 120, height:220)
                                        .offset(x: shotArrowXPosition - geometry.size.width + 200)
                                        .opacity(shotArrowOpacity)
                                    
                                }
                            }
                        }
                        
                        
                        Button("Shoot!") {
                            
                            if yOffset == -100 {
                                success = true
                                
                            } else {
                                success = false
                            }
                        }
                        .font(.title2)
                        .padding(50)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        .offset(x:0)
                        
                    }
                    
                    Spacer()
                }
                .padding(.trailing, 50)
                
                Spacer()
                    .frame(height: 200)
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    LionView()
}
