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
    
    var body: some View {
        
        
        ZStack {
            Image("Hercules")
                .resizable()
                .frame(width: 500, height: 900)
                .ignoresSafeArea()
                .brightness(-0.4)
                .aspectRatio(contentMode: .fill)
            Text(animatedText)
                .padding()
                .foregroundStyle(.white)
                .font(.title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(50)
                .onAppear {
                    animateText()
                    
                }
            
            NavigationLink("Continue") {
                BeforeCerberusView()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .offset(x:0, y: 300)
            .padding()
            .foregroundColor(.black)
            
        }
        
        .padding()
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText.append(character)
                
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}

#Preview {
    AftStymphalianView()
}
