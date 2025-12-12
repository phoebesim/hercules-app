//
//  GeryonView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 10/11/25.
//

import SwiftUI
import ConfettiSwiftUI

struct GeryonView: View {
    @State private var step: CGFloat = 220
    @State private var timer: Timer?
    @State private var isGreen: Bool = true
    @State private var loseShown = false
    @State private var confettiTrigger: Int = 0

    
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
                            loseShown = true
                            step = 230
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                        loseShown = false
                                    }
                        }
                        
                    }
                    
                    .foregroundColor(.black)
                    .bold()
                    .padding(35)
                    .background(Color.white)
                    .clipShape(.circle)
                    .offset(y:320)
                
                    
                    if loseShown == true {
                       
                        Text("Try again")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.white)
                            .offset(x: 0, y: -350)
                       
                    }
              
            

                
                Image(isGreen ? "GreenLight":"RedLight")
                    .offset(x: 130, y: -190)
                
                if step <= 45 {
               
                    ZStack {
                        Image(.greece)
                            .resizable()
                            //.fill(.ultraThinMaterial)
                            .ignoresSafeArea()
                            //.brightness(-0.3)
                        VStack(spacing: 24) {
                            Spacer()
                            Text("You Won")
                                
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .confettiCannon(trigger: $confettiTrigger, num: 50, confettiSize: 20.0, radius: 800.0)

                                                            
                                                            
                                                            .onAppear {
                                                                confettiTrigger += 1 
                                                            }
                            
                            Spacer()
                            
                            Button {
                                scene = .endGeryon
                            } label: {
                                Text("Continue")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                            
                            
                            
                            .background(Color.white)
                            .cornerRadius(15)
                            .foregroundColor(.black)
                            .padding()
                            .padding(.horizontal, 60)
                            /*} label: {
                                Text("Continue")
                                    .padding()
                                    .font(.title2.weight(.semibold))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, minHeight: 56, )
                                    .padding()
                            }
                            
                            /*
                            .background(Color.pink)
                            .cornerRadius(12)
                            .padding(.horizontal, 60)
                            .padding(.bottom, 40)
                             */
                            .background(Color.white)
                            .cornerRadius(15)
                            .foregroundColor(.black)
                            .padding(.horizontal, 60)
                            .padding(.bottom, 40)*/
                        }
                    }
            
    
                        
                    
                    
                }
            }
//            .sheet(isPresented: $loseSheetShown) {
//                Text("You need to steal Geryon's cattle while he is sleeping! Only move when the light is green!")
//                    .presentationDetents([.medium, .large, .fraction(0.2)])
//            }
            
          
            .toolbar{
                ToolbarItem {
                    Button{
                        scene = .quest
                    } label: {
                        Image(systemName: "house")
                            .foregroundStyle(.primary)
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
