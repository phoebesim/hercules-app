//
//  AftDog.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct AftCerberusView: View   {
    let textToType = "After you showed Eurystheus Cerberus, he fled in terror and begged you to return the beast, offering to free you from all remaining labours."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    @Binding var completedCerberus: Bool
    
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
                        completedCerberus = true
                        scene = .lastInfo
                        
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
//    AftCerberusView(scene: .constant(.endCerberus))
//}
