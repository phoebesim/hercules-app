//
//  AftDeerView.swift
//  HerculesApp
//
//  Created by T Krobot on 19/11/25.
//

//
//  AftDeerView 2.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 18/11/25.
//


import SwiftUI

struct AftDeerView: View   {
    let textToType = "After a year of searching, you finally captured the hind with a net while it was asleep. But you immediately realised you had messed up: the hind was a sacred animal to the fierce goddess Artemis! Luckily for you, you met her and on your way back to King Eurystheus. You begged her for forgiveness. After listening to your explanation, she forgave you on the condition you would return the hind to the wild. Just before the King could grab it from your hands, you let go of the hind and it dashed back to the wild!"
    
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
                ScrollView{
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
                }
                
                NavigationLink("Continue") {
                    BeforeAugeanView()
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
                
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}

#Preview {
    AftDeerView()
}
