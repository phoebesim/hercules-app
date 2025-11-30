//
//  CattleView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct BeforeGeryonView: View   {
    let textToType = "Your tenth labour: to steal the prized cattle of the giant Geryon, who has three bodies. On the way, you received a golden cup from the sun god Helios as he was impressed with your audacity to shoot at the Sun. You killed Orthus the two-headed dog and Eurytion the herdsman as well."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    
    var body: some View {
        
        NavigationStack{
            ZStack (alignment: .leading){
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
                    scene = .continueGeryon
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

//#Preview {
//    BeforeGeryonView(startGeryon: .constant(true), continueGeryon: .constant(false))
//}
