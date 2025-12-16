//
//  AftBirdView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct AftStymphalianView: View   {
    let textToType = "As soon as you scared the birds into the air, you shot the birds down with arrows and completed the labour."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    @Binding var completedStymphalian: Bool
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
                        completedStymphalian = true
                        scene = .startGeryon
                        
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
    }
    
    func animateText() {
        for (index, character) in textToType.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText.append(character)
                
                
            }
        }
    }
}
