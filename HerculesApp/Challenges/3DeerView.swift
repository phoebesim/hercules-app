//
//  DeerView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct DeerView: View {
    
    @State private var xOffset: CGFloat = 0
    @State private var message: String = ""
    @State private var gameOver = false
    
    private let tolerance: CGFloat = 20
    
    //ADD: SLIDER TO CONTROL DIFFICULTY
    
    
    var body: some View {
        
        ZStack{
            
            Image("Grass")
                .resizable()
                .brightness(-0.232)
                .scaledToFill()
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("Trap the Hind!")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(.top, 60)
                
                Spacer()
                
                
                Image("Deer")
                    .resizable()
                    .frame(width:200, height:200)
                    .brightness(-0.1)
                    .offset(x: xOffset, y: -10)
                
                
                Spacer()
                
                ZStack {
                    
                    Image(.net)
                        .resizable()
                        .frame(width:115, height:170)
                    Button("Get your weapon!"){
                        BackgroundRemovalView()
                    }
                }
                
                
                Image(systemName: "arrowshape.up.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                
                
                
                Button(action: checkIfAtCenter) {
                    
                    Text("Shoot!")
                        .font(.title2)
                        .padding(50)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        .offset(y: 20)
                        .bold()
                    
                }
                
                Spacer()
                
                Text(message)
                    .padding()
                    .font(.title3)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .onAppear{
                Timer.scheduledTimer(withTimeInterval:0.9, repeats: true) {_ in
                    withAnimation(.easeInOut(duration: 0.8) ) {
                        xOffset = CGFloat.random(in: -200...200)
                    }
                }
                
            }
            if gameOver {
                WinView()
            }
            
        }
        
        
    }
    
    private func checkIfAtCenter() {
        if abs(xOffset) < tolerance {
            
            message = "You won!!!"
            
            gameOver = true
            
        } else {
            message = "Try again..."
        }
    }
    
}

#Preview {
    DeerView()
}
