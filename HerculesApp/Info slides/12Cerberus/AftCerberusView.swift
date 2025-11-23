//
//  AftDog.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct AftCerberusView: View   {
    let textToType = "After showing Eurystheus Cerberus, he so frightened he fled to his storeroom. He begged for you to return Cerberus to the Underworld, in exchange for releasing you from any further labours."
    
    @State private var animatedText: String = ""
    
    @Binding var endCerberus: Bool
    @Binding var endStory: Bool
    
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
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .padding(50)
                    .onAppear {
                        animateText()
                        
                    }
                
                NavigationLink("Continue") {
                    EndView()
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
    AftCerberusView(endCerberus: .constant(true), endStory: .constant(true))
}
