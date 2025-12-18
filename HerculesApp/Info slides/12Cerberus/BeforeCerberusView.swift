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
                        .padding()
                        .padding()
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
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
