//
//  AftBirdView.swift
//  HerculesApp
//
//  Created by T Krobot on 17/11/25.
//
import SwiftUI

struct BeforeCerberusView: View   {
    let textToType = "Your twelfth labour: capturing and bringing back Cerberus, the three-headed dog belonging to Hades, from the Underworld. You asked for permission from Hades, god of the Underworld, to fight Cerberus unassisted by weapons. After overpowering it with your hands, you must now walk back to Eurystheus... for the last time."
    
    @State private var animatedText: String = ""
    
    @Binding var startCerberus: Bool
    @Binding var continueCerberus: Bool
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("Hercules")
                    .resizable()
                    .frame(width: 500, height: 900)
                    .ignoresSafeArea()
                    .brightness(-0.4)
                    .aspectRatio(contentMode: .fill)
                Text(animatedText)
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .padding(50)
                    .onAppear {
                        animateText()
                        
                    }
                
                Button{
                    
                    startCerberus = false
                    continueCerberus = true
                    
                } label: {
                    Text("Continue")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .offset(x: 0, y: 300)
                .foregroundColor(.black)
                
            }
            
            .padding()
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
    BeforeCerberusView(startCerberus: .constant(true), continueCerberus: .constant(false))
}
