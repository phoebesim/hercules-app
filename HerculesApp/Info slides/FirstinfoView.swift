//
//  FirstinfoView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct FirstinfoView: View   {
    let textToType = "You have incurred Hera’s wrath...Because you exist. You are a result of Zeus’ infidelity. Hera tried to stop your birth. Hera tried to kill you as a baby. Hera turned you into a murderer. Hera made you a slave for your cousin and king Eurystheus. Now, you must perform 10 labours for him. You are Hercules."
    
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
            NavigationLink {
                // 3. Specify the Destination View
                BeforeLionView()
            } label: {
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
    FirstinfoView()
}
