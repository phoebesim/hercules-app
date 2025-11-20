//
//  AftDog.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct AftAugeanView: View   {
    let textToType = "You rerouted the rivers  Alpheus and Peneus to wash out the filth. You even got Augeas to give you a tenth of the cattle if you finished in a day, which you did! However, when you returned to Eurystheus, he said the labour did not count as you accepted payment and the river had done the work."
    
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
                    BeforeStymphalianView()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x:0, y: 300)
                .padding()
                .foregroundColor(.black)
                
            }
            
           
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
    AftAugeanView()
}
