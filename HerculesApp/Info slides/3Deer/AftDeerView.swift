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
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .leading) {
                
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -20)
                ScrollView{
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
                }
                
                    Button("Continue") {
                        scene = .startAugean
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .offset(x:0, y: 300)
                    .padding()
                    .foregroundColor(.black)
                    .offset(x: 180)
                    
                
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
    AftDeerView(scene: .constant(.endDeer))
}
