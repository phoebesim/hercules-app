//
//  DogView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct BeforeAugeanView: View   {
    let textToType = "Your fifth labour: clean King Augeas’ stables, untouched for 30 years and overflowing with immortal livestock dung!"
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    

    
    var body: some View {
        
        NavigationStack {
            ZStack (alignment: .leading) {
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .offset(x: -20)
                
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
                    scene = .continueAugean
                } label: {
                    Text("Continue")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x: 0, y: 300)
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
    BeforeAugeanView(scene: .constant(.startAugean))
}
