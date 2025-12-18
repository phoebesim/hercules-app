//
//  FirstinfoView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI
import ConfettiSwiftUI

struct EndView: View   {
    let textToType = "After finishing your 12 labours, you joined the Argonauts in their quest to find the Golden Fleece and lived a life of heroism. In death, Zeus made you a minor god, and you married Hebe. Your journey as Hercules ends here."
    
    @State private var confettiTrigger: Int = 0
    @State private var animatedText: String = ""
    @Binding var scene: AppScene
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                 //   .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -40)
                    .ignoresSafeArea()
                VStack {
                    Text(animatedText)
                    
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .padding()
                        .padding()
                    
                    Spacer()
                    
                    Button {
                        scene = .quest
                        
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    
                }
              
                .padding()
                .onAppear {
                    animateText()
                }
                
                
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
