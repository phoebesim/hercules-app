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
    @State private var imagePosition: CGPoint? = nil
    @State private var success: Bool = false
 
    
    var body: some View {
       
        ZStack{
            Image("Grass")

            
            VStack {
                Text("Shoot the Nemean Lion!")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                ZStack {
                    Image("Lion")
                        .resizable()
                        .frame(width: 300, height:300)
                    
                    if success {
                        Image(.arrowCutout)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .offset(x:0, y:100)
                            .zIndex(1)
                    }
                }
                ZStack {
                    Image("Bow")
                        .resizable()
                        .frame(width: 250, height: 150)
                        .padding()

                    
                    if !success {
                        Image(.arrowCutout)
                            .resizable()
                            .frame(width: 120, height: 220)
                            .zIndex(1)
                        
                    }
                                    }
                
    
                HStack {
                    Image("wall")
                        .resizable()
                        .frame(width: 60, height: 120)
                        .offset(y: -50)
                    
                    Image(systemName: "arrowshape.left.fill")
                        .offset(y: yOffset)
                        .foregroundStyle(.white)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true)) {
                                yOffset = -100
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
                    .padding()
                }
            
                
            }
            .padding(.trailing, 50)
            
            Spacer()
            .frame(height: 200)
            
            
            VStack {

            }
        }
    }
}

#Preview {
    LionView()
}
