//
//  BeforehindView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct BeforeDeerView: View   {
    let textToType = "Your third labour: capture the Ceryneian Hind alive—faster than any arrow and visible only by the moonlight on its antlers."
    
    @State private var animatedText: String = ""
    @Environment(\.dismiss) var dismiss
    
    @Binding var scene: AppScene
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                
                Image("Hercules")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                  //  .offset(x: -20)
                
                VStack {
                    Text(animatedText)
                    
                        .foregroundStyle(.white)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(50)
                    
                    Spacer()
                    
                    Button {
                        scene = .continueDeer
                        
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
    //    .navigationBarBackButtonHidden()
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
    BeforeDeerView(scene: .constant(.continueDeer))
}
