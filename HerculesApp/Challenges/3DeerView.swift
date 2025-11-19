//
//  DeerView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct DeerView: View {
    
    @State private var xOffset: CGFloat = 0
    @State private var message: String = ""
    @State private var gameOver = false
    @State private var weaponSheet = false
    @State private var timer: Timer? = nil
    
    @State var weaponImage: UIImage?
    @State var showButton = true
    
    @State private var weaponYOffset = 0
    
    
    private let tolerance: CGFloat = 20
    
    //ADD: SLIDER TO CONTROL DIFFICULTY
    
    
    var body: some View {
        
        ZStack{
            
            Image("Grass")
                .resizable()
                .brightness(-0.232)
                .scaledToFill()
                .ignoresSafeArea()
            
            
            VStack{
                
                Text("Trap the Hind!")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(.top, 60)
                
                Spacer()
                
                
                Image("Deer")
                    .resizable()
                    .frame(width:200, height:200)
                    .brightness(-0.1)
                    .offset(x: xOffset, y: -10)
                
                
                Spacer()
                
                ZStack {
                    
                    if showButton == true {
                        Image(.net)
                            .resizable()
                            .frame(width:115, height:170)
                        
                    }
                    
                    if let img = weaponImage {
                        
                        Image (uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .offset(x: CGFloat(weaponYOffset))
                            .rotationEffect(Angle(degrees: 90))
                    }
                    if showButton == true {
                        Button("Get your weapon!"){
                            weaponSheet = true
                            showButton = false
                            
                            
                        }
                        .buttonStyle(.bordered)
                        .background()
                        .cornerRadius(8)
                    }
                }
                
                .sheet(isPresented: $weaponSheet) {
                    
                    BackgroundRemovalView(onDone: { image in weaponImage = image; weaponSheet = false })
                    
                    
                }
                
                
                Image(systemName: "arrowshape.up.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                
                
                
                Button{
                    checkIfAtCenter()
                    if gameOver {
                        withAnimation(.easeInOut) {
                            weaponYOffset = -200
                        }
                    }
                } label: {
                    
                    Text("Shoot!")
                        .font(.title2)
                        .padding(50)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        .offset(y: 20)
                        .bold()
                    
                }
                
                Spacer()
                
                Text(message)
                    .padding()
                    .font(.title3)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .onAppear{
                startTimer()
                
            }
            if gameOver {
                WinView()
            }
            
        }
        
        
    }
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.8)) {
                xOffset = CGFloat.random(in: -200...200)
            }
            if gameOver {
                stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        xOffset = 0
    }
    
    
    private func checkIfAtCenter() {
        if abs(xOffset) < tolerance {
            
            message = "You won!!!"
            
            gameOver = true
            
        } else {
            message = "Try again..."
        }
    }
    
}

#Preview {
    DeerView()
}
