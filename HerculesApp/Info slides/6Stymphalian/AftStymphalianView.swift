//
//  AftBirdView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct AftStymphalianView: View   {
    let textToType = "As soon as you scared the birds into the air, you shot the birds down with arrows and completed the labour."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    @Binding var completedStymphalian: Bool
    
    var body: some View {
        
        
        ZStack (alignment: .leading){
            Image("Hercules")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .brightness(-0.4)
              //  .offset(x: -20)
            VStack {
                Text(animatedText)
                
                    .foregroundStyle(.white)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(50)
                    
                }
                .padding()
                .onAppear {
                    animateText()
                }
                
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText.append(character)
            }
        }
    }
}
