//
//  CattleView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct CattleView: View   {
    let textToType = "Your tenth labour: to steal the prized cattle of the giant Geryon, who has three bodies. On the way, you received a golden cup from the sun god Helios as he was impressed with your audacity to shoot at the Sun. You killed Orthus the two-headed dog and Eurytion the herdsman as well."
    
    @State private var animatedText: String = ""
    
    var body: some View {
        
        
        ZStack {
            Image("Hercules")
                .resizable()
                .frame(width: 500, height: 900)
                .ignoresSafeArea()
                .brightness(-0.4)
                .aspectRatio(contentMode: .fill)
            
            VStack {
                Text(animatedText)
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(50)
            }
            .onAppear {
                animateText()
                
            }
            
            Button("Continue") {
                
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
    CattleView()
}

