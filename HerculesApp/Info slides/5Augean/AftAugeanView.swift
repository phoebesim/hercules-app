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
    @Binding var completedAugean: Bool
    
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -20)
                
                VStack {
                    Text(animatedText)
                    
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(50)
                    
                    Spacer()
                    
                    Button {
                        scene = .startStymphalian
                        completedAugean = true
                        
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    //.padding(50)
                    .padding(.horizontal, 60)
                    .padding(.bottom, 40)
                    
                }
                .padding()
                .onAppear {
                    animateText()
                }
                
                
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
    AftAugeanView(scene: .constant(.endAugean), completedAugean: .constant(true))
}
