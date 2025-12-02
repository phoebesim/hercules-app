//
//  FirstinfoView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI
import ConfettiSwiftUI

struct EndView: View   {
    let textToType = "After finishing your 12 labours, you joined the Argonauts and lived a life of constant heroism. In death, Zeus made you a minor god, and you married Hebe. Your journey as Hercules ends here."
    
    @State private var confettiTrigger: Int = 0
    @State private var animatedText: String = ""
    @Binding var scene: AppScene
    
    
    
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
                    VStack {
                        Text(animatedText)
                            .padding()
                            .foregroundStyle(.white)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .padding(50)
                            .confettiCannon(trigger: $confettiTrigger)
                        
                        
                        
                        
                        
                    }
                    .onAppear {
                        animateText()
                        confettiTrigger += 1
                        
                    }
                }
                
                Button {
                    scene = .quest
                    
                } label: {
                    Text("Play again")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .offset(x:0, y: 300)
                        .padding()
                        .foregroundColor(.black)
                }
                
            }
            
            .padding()
        }
        .navigationBarBackButtonHidden()
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
    EndView(scene: .constant(.lastInfo))
}
