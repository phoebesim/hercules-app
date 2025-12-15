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
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                   // .offset(x: -20)
                    .confettiCannon(trigger: $confettiTrigger)
                
                VStack {
                    Text(animatedText)
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(50)
                    
                    Spacer()
                    
                    Button {
                        scene = .quest
                        
                    } label: {
                        Text("Finish")
                            .padding()
                            .frame(maxWidth: .infinity)
                           
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .padding(50)
                }
                .onAppear {
                    animateText()
                    confettiTrigger += 1
                }
                
                
                
                .padding()
                
            }
            
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
