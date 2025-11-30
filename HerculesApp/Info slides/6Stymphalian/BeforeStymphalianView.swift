//
//  BeforeBirdView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct BeforeStymphalianView: View   {
    let textToType = "Your sixth labour: to slay the Stymphalian birds. They are man-eating birds with bronze beaks and sharp metallic feathers they can launch at you! And their dung is highly toxic. They are too far into the swamp for you to reach. Fortunately, Athena has noticed your plight and gifted you a rattle, called a krotala, made by Hephaestus that you can use to scare the birds into the air!"
    
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
                    scene = .continueStymphalian
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
//
//#Preview {
//    BeforeStymphalianView(startStymphalian: .constant(true), continueStymphalian: .constant(false))
//}
