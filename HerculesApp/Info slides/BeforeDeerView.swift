//
//  BeforehindView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct BeforeDeerView: View   {
    let textToType = "Your third labour: to capture the Ceryneian Hind and deliver it to the King alive. It can outpace even the best arrows and is only visible by a glint of moonlight on its antlers."
    
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
            
            NavigationLink{
                DeerView()
            } label: {
                Text("Continue")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .offset(x: 0, y: 300)
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
    BeforeDeerView()
}
