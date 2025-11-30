//
//  GeryonView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 10/11/25.
//

import SwiftUI

struct GeryonView: View {
    @State private var step: CGFloat = 250
    @State private var timer: Timer?
    @State private var isGreen: Bool = true
    @State private var loseSheetShown = false
    
    @Binding var scene: AppScene
    
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
                        step = 280
                    }
                    
                }

                .foregroundColor(.black)
                .bold()
                .padding(35)
                .background(Color.white)
                .clipShape(.circle)
//                .buttonStyle(.borderedProminent)
                .offset(y:350)
//                .tint(.white)
//                .padding(50)
//                .foregroundStyle(.black)
//                .controlSize(.extraLarge)
//                .buttonBorderShape(.circle)
//                .fontWeight(.bold)
                
                Image(isGreen ? "GreenLight":"RedLight")
                    .offset(x: 130, y: -190)
                
                if step <= 45 {
               
                    ZStack {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .ignoresSafeArea()
                        VStack(spacing: 24) {
                            Spacer()
                            Text("You won!!!")
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            Button {
                                scene = .endGeryon
                            } label: {
                                Text("Continue")
                                    .padding()
                                    .font(.title2.weight(.semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 56, )
                                    .padding()
                            }
                            .background(Color.gray)
                            .cornerRadius(12)
                            .padding(.horizontal, 60)
                            .padding(.bottom, 40)
                            
                        }
                    }
            
    
                        
                    
                    
                }
            }
            .sheet(isPresented: $loseSheetShown) {
                Text("You need to steal Geryon's cattle while he is sleeping! Only move when the light is green!")
                    .presentationDetents([.medium, .large, .fraction(0.2)])
            }
            .toolbar{
                ToolbarItem {
                    Button{
                        scene = .quest
                    } label: {
                        Image(systemName: "house")
                            .foregroundStyle(.black)
                            .frame(width: 50, height: 50)
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)

    }
    
    
    func randomDelay() -> Double {
        return Double.random(in: 0.3...0.9)
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
    GeryonView(scene: .constant(.continueGeryon))
}
