//
//  AmazonView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI

struct AmazonView: View {
    
    @State private var xOffset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Image("Grass")
            
            VStack {
                Image("Stickman")
                    .resizable()
                    .frame(width:50, height:110)
                    .offset(x: xOffset)
                
                HStack{
                    Spacer()
                    Button("Left"){
                        xOffset -= 110
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Spacer()
                        
                        Button("Right") {
                            xOffset += 110
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AmazonView()
}
