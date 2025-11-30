//
//  AftDog.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct AftAugeanView: View   {
    let textToType = "You diverted the Alpheus and Peneus to clean the stables in a day, but Eurystheus refused to count it, saying you took payment and let the rivers do the work."
    
    @State private var animatedText: String = ""
    @Binding var scene: AppScene
    
    
    var body: some View {
        
        NavigationStack {
            ZStack (alignment: .leading){
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -20)
                    .aspectRatio(contentMode: .fill)
                Text(animatedText)
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .padding(50)
                    .onAppear {
                        animateText()
                        
                    }
                
                Button ("Continue") {
                    scene = .startStymphalian
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x:0, y: 300)
                .padding()
                .foregroundColor(.black)
                .offset(x: 180)
                
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

#Preview {
    AftAugeanView(scene: .constant(.endAugean))
}
