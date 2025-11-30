//
//  BeforehindView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct BeforeDeerView: View   {
    let textToType = "Your third labour: to capture the Ceryneian Hind and deliver it to the King alive. It can outpace even the best arrows and is only visible by a glint of moonlight on its antlers."
    
    @State private var animatedText: String = ""
    @Environment(\.dismiss) var dismiss
    
    @Binding var scene: AppScene
    
    
    var body: some View {
        ZStack (alignment: .leading) {
            Image("Hercules")
                .resizable()
                .aspectRatio(contentMode:  .fill)
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
                scene = .continueDeer
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
    BeforeDeerView(scene: .constant(.startDeer))
}
