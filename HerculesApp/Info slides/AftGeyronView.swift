//
//  Untitled.swift
//  HerculesApp
//
//  Created by T Krobot on 19/11/25.
//

//
//  AftStable.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct AftGeryonView: View   {
    let textToType = "On your way back home after stealing the cattle, Hera sent a gadfly to bite the cattle and scatter them! You finally retrieved them after a year. Then, Hera sent a flood that raised the level of the river so high that you could not cross over it. Using your Athena-gifted wits, you pile stones in the river to make it shallower. When you finally reach the court of Eurystheus, the cattle are sacrificed to Hera."
    
    @State private var animatedText: String = ""
    
    var body: some View {
        
        
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
                BeforeCerberusView()
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
    AftGeryonView()
}
