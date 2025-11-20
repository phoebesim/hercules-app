//
//  DogView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct BeforeAugeanView: View   {
    let textToType = "Your fifth labour: to clean the stables of King Augeas. The divine livestock in it are immortal, and it has not been cleaned in over 30 years, leading to a huge pileup of dung!"
    
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
                    
                    AugeanView()
                    
                    
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
        .navigationBarBackButtonHidden(true)
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
    BeforeAugeanView()
}
