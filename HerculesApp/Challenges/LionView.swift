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
//@State private var
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
        }
    }
}

#Preview {
    LionView()
}
