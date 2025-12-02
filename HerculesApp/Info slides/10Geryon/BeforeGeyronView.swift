//
//  CattleView.swift
//  HerculesApp
//
//  Created by T Krobot on 14/11/25.
//
import SwiftUI

struct BeforeGeryonView: View   {
    let textToType = "Your tenth labour: steal Geryon’s cattle. With Helios’s golden cup, you defeated his two-headed dog and herdsman to claim the herd."
    
    @State private var animatedText: String = ""
    
    @Binding var scene: AppScene
    
    var body: some View {
        
        NavigationStack{
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
                        scene = .continueGeryon
                        
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
//    BeforeGeryonView(startGeryon: .constant(true), continueGeryon: .constant(false))
//}
