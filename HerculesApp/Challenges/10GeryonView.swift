//
//  GeryonView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 10/11/25.
//

import SwiftUI
import ConfettiSwiftUI

struct GeryonView: View {
    @State private var step: CGFloat = 140
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
                GeometryReader { geometry in
                    Image(.geryon)
                        .resizable()
                        .frame(width: 250, height: 300)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 6.9)
                               
                    Image(.cow)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2.8)

                    Image(.cow)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .position(x: geometry.size.width / 1.5, y: geometry.size.height / 2.7)

                    Image(.cow)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .position(x: geometry.size.width / 3, y: geometry.size.height / 2.5)

                    Image(.cow)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2.5)

                    Image(.cow)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .position(x: geometry.size.width / 1.6, y: geometry.size.height / 2.6)

                    Image(.cow)
                        .resizable()
                        .frame(width: 180, height: 120)
                        .position(x: geometry.size.width / 1.5, y: geometry.size.height / 2.5)

                }
              
                Image(.stickman)
                    .resizable()
                    .frame(width: 50, height: 100)
                    .offset(y: step)

                
                
                GeometryReader { geometry in
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
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.1)

                    
                }
                    if loseShown == true {
                       
                        Text("Try again")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.white)
                            .offset(x: 0, y: -350)
                       
                    }
              
            

                GeometryReader { geometry in
                    Image(isGreen ? "GreenLight":"RedLight")
                        .position(x: geometry.size.width / 1.3, y: geometry.size.height / 5)
                    //      .offset(x: 130, y: -190)
                }
                if step <= 45 {
               
                    YouWonViewGeryon(scene: $scene)
            
    
                        
                    
                    
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
