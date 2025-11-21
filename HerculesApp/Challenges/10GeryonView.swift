//
//  GeryonView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 10/11/25.
//

import SwiftUI

struct GeryonView: View {
    @State private var step: CGFloat = 300
    @State private var timer: Timer?
    @State private var isGreen: Bool = true
    @State private var loseSheetShown = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.grass)
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 500, height: 500)
                Image(.geryon)
                    .resizable()
                    .frame(width: 250, height: 300)
                    .offset(y:-170)
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
                    changeLight()
                    if isGreen == false {
                        loseSheetShown = true
                        step = 300
                    }
                    
                }
                .buttonStyle(.borderedProminent)
                .offset(y:380)
                .tint(.white)
                .padding(50)
                .foregroundStyle(.black)
                .controlSize(.extraLarge)
                .buttonBorderShape(.circle)
                .fontWeight(.bold)
                Image(isGreen ? "GreenLight":"RedLight")
                    .offset(x: 130, y: -190)
                
                if step <= 200 {
                    WinView(nextInfoView: .constant(AnyView(AftGeryonView())))
                        .ignoresSafeArea()
                        .zIndex(1)
                        
                    
                    
                }
            }
            .sheet(isPresented: $loseSheetShown) {
                Text("You need to steal Geryon's cattle while he is sleeping! Only move when the light is green!")
                    .presentationDetents([.medium, .large, .fraction(0.2)])
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)

    }
    
    
    func randomDelay() -> Double {
        return Double.random(in: 0.3...1.2)
    }
    
    func changeLight(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: randomDelay(), repeats: true) { t in
            isGreen.toggle()
            t.invalidate()
            DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay()) {
                changeLight()
            }
        }
    }
}



#Preview {
    GeryonView()
}
