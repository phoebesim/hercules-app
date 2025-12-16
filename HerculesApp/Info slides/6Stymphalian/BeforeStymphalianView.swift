//
//  BeforeBirdView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct BeforeStymphalianView: View   {
    let textToType = "Your sixth labour: slay the Stymphalian birds—man-eaters with bronze beaks and razor feathers. They hide deep in the swamp, but Athena aids you with a Hephaestus-forged rattle to drive them into the air."
    
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
                        .padding()
                        .padding()
                        .padding()
                    
                    Spacer()
                    
                    Button {
                        scene = .startAugean
                        
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

//
//#Preview {
//    BeforeStymphalianView(startStymphalian: .constant(true), continueStymphalian: .constant(false))
//}
