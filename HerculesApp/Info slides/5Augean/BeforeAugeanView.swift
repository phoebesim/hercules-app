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
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                //    .offset(x: -20)
                
                VStack {
                    Text(animatedText)
                    
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(50)
                    
                    Spacer()
                    
                    Button{
                        scene = .continueAugean
                        
                    } label: {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                    .padding(50)
                    
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
    BeforeAugeanView(scene: .constant(.startAugean))
}
