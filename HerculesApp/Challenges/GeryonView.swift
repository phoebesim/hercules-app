//
//  GeryonView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 10/11/25.
//

import SwiftUI

struct GeryonView: View {
    @State private var step: CGFloat = 300
    @State private var randomNumber: Double = 0.0
    @State private var image: String = "GreenLight"
    
    
    var body: some View {
        
        ZStack {
            Image(.grass)
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            Image(.geryon)
                .resizable()
                .frame(width: 250, height: 300)
                .offset(y:-190)
            Image(.cow)
                .resizable()
                .frame(width: 180, height: 120)
                .offset(x:-80, y:-80)
            Image(.cow)
                .resizable()
                .frame(width: 180, height: 120)
                .offset(y:-80)
            Image(.cow)
                .resizable()
                .frame(width: 180, height: 120)
                .offset(x:80, y:-50)
            Image(.cow)
                .resizable()
                .frame(width: 180, height: 120)
                .offset(x:-100, y:-25)
            Image(.cow)
                .resizable()
                .frame(width: 180, height: 120)
                .offset(x:-10, y:-10)
            Image(.cow)
                .resizable()
                .frame(width: 180, height: 120)
                .offset(x:50, y:10)
            Image(.stickman)
                .resizable()
                .frame(width: 50, height: 100)
                .offset(y: step)
            Button("Walk") {
                step -= 10
            }
            .buttonStyle(.borderedProminent)
            .offset(y:380)
            .tint(.white)
            .padding(50)
            .foregroundStyle(.black)
            .controlSize(.large)
            .buttonBorderShape(.circle)
            .fontWeight(.bold)
            Image(image)
                .offset(x: 130, y: -190)
        }
        
        
    }
    func generateNewNumber() {
        randomNumber = Double.random(in: 1...100)
    }
    func changeLight(){
        
    }
}


#Preview {
    GeryonView()
}
