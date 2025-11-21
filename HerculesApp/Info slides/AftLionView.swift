//
//  AftlionView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI

struct AftLionView: View {
    let textToType = "The Nemean lion’s fur could not be penetrated by arrows, but thanks to your quick thinking, you used a club to stun it, then strangled it!"
    
    @State private var animatedText: String = ""
    
    var body: some View {
        
        NavigationStack {
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
                    BeforeDeerView()
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

#Preview {
    AftLionView()
}
