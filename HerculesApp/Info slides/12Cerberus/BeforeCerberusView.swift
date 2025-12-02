//
//  AftBirdView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct BeforeCerberusView: View   {
    let textToType = "Your final labour: capture Cerberus barehanded with Hades’ permission and bring it back to Eurystheus."
    
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
                    .offset(x: -20)
                
                VStack {
                    Text(animatedText)
                      
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(50)
                    
                    Spacer()
                    
                    Button {
                        scene = .continueCerberus
                        
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

//#Preview {
//    BeforeCerberusView(startCerberus: .constant(true), continueCerberus: .constant(false))
//}
