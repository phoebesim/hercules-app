//
//  LionView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI
import Combine

struct LionView: View {
    
@State private var arrowPosition: CGFloat = 50
@State private var movingUp = true
@State private var isShooting = false
@State private var shotArrowOffset: CGFloat = 0
@State private var shotSuccess = false
    
let timer = Timer.publish(every:0.05, on: .main, in: .common).autoconnect()
    
    let pillarHeight: CGFloat = 100
    
    var body: some View {
       
        ZStack{
            Image("Grass")
                .brightness(-0.2)
            
            VStack {
                Text("Shoot the Nemean Lion!")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
                Image("Lion")
                    .resizable()
                    .frame(width: 300, height:300)
                
                if shotSuccess && isShooting {
                    Image("Pencil")
                        .offset(y: -30)
                        .frame(width: 200, height: 150)
                }
                
                    
                
                
                ZStack {
                    Image("Pencil")
                        .resizable()
                        .frame(width: 200, height: 150)
                        
                    
                    Image("Bow")
                        .resizable()
                        .frame(width: 250, height: 150)
                        .padding()
                }
                
    
                
                Button("Shoot!") {
                    
                }
                .font(.title2)
                .padding(50)
                .background(Color.white)
                .foregroundColor(.black)
                .clipShape(Circle())
                .offset(x:0)
                .padding()
            
                
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
