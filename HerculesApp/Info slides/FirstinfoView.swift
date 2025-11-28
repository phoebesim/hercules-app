//
//  FirstinfoView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct FirstinfoView: View   {
    let textToType = "You have incurred Hera’s wrath...because you exist. You are a result of Zeus’ infidelity. Hera tried to stop your birth. Hera tried to kill you as a baby. Hera turned you into a murderer. Hera made you a slave for your cousin and king Eurystheus. Now, you must perform 10 labours for him. You are Hercules."
    
    @State private var animatedText: String = ""
//    @Binding var homePage: Bool
    @Binding var startStory: Bool
    

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
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .padding(50)
                }
                .onAppear {
                    animateText()
                    
                }
                Button {
                    startStory = false
                 
                } label: {
                    Text("Continue")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x:0, y: 300)
                .padding()
                .foregroundColor(.black)
                
                
                .padding()
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
    FirstinfoView(startStory: .constant(true))
}
