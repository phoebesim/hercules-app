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
    let textToType = "After a year’s hunt, the hero caught Artemis’s sacred hind, earned her forgiveness, and released it before Eurystheus could seize it."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    @Binding var completedDeer: Bool
    
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
                        scene = .startAugean
                        completedDeer = true
                        
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
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
    AftDeerView(scene: .constant(.endDeer), completedDeer: .constant(true))
}
