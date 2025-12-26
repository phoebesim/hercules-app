//
//  DeerView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI
import ConfettiSwiftUI
struct DeerView: View {
    
    @State private var xOffset: CGFloat = 200
    @State private var message: String = ""
    @State private var gameOver = false
    @State private var weaponSheet = false
    @State private var timer: Timer? = nil
    @State private var confettiTrigger: Int = 0
    @State var weaponImage: UIImage?
    @State private var weaponYOffset = 0
    @State private var tolerance: CGFloat = 30
    
    @Binding var showButton: Bool
    
    @Binding var scene: AppScene
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Image("Grass")
                    .resizable()
                    .brightness(-0.232)
                    .scaledToFill()
                    .ignoresSafeArea()
                
                
                VStack{
                    //  Text ("Difficulty")
                    // .bold()
                    /*  Slider(value: $tolerance, in: 5...50)
                     .padding()*/
                    
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
                        
                        //                        if showButton == true {
                        //                            Image(.net)
                        //                                .resizable()
                        //                                .frame(width:115, height:170)
                        //                        }
                        
                        
                        if let img = weaponImage {
                            GeometryReader { geometry in
                                Image (uiImage: img)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .position(x: CGFloat(weaponYOffset), y: geometry.size.height / 2)
                                    
                                    .rotationEffect(Angle(degrees: 90))
                            }
                        }
                    }
                    //                        if showButton == true {
                    //                            Button("Get your weapon!"){
                    //                                weaponSheet = true
                    //                                showButton = false
                    //
                    //                            }
                    //                            .buttonStyle(.bordered)
                    //                            .background()
                    //                            .cornerRadius(10)
                    //                        }
                    
                    
                    // .sheet(isPresented: $weaponSheet) {
                    GeometryReader { geometry in
                    if weaponImage == nil {
                        BackgroundRemovalView(weapon: .constant("a net (e.g. a towel)"), onDone: { image in
                            weaponImage = image
                            weaponSheet = false
                            showButton = false
                        })
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 20)
                    }
                    //  }
                   
                   
                        
                        Button{
                            checkIfAtCenter()
                            
                            withAnimation(.easeInOut) {
                                weaponYOffset = -200
                                
                                withAnimation(.easeInOut) {
                                    weaponYOffset = 0
                                }
                            }
                        } label: {
                            
                            Text("Shoot!")
                                .font(.title2)
                                .padding(35)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.5)
                                .bold()
                            
                        }
                         .disabled(weaponImage == nil)
                        .opacity(weaponImage == nil ? 0.5 : 1.0)
                        
                        
                        Image(systemName: "arrowshape.up.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2.4)

                        
                        
                        
                        Text(message)
                            .padding()
                            .font(.title3)
                            .foregroundColor(.white)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.2)
                        
                        Spacer()
                    }
                }
                .onAppear{
                    startTimer()
                    
                }
                if gameOver {
                    YouWonViewDeer(scene: $scene)
                    // .background(Color.pink)
                    //.cornerRadius(12)
                    //.padding(.horizontal, 60)
                    //.padding(.bottom, 40)
                    /*
                     .background(Color.white)
                     .cornerRadius(15)
                     .foregroundColor(.black)
                     .padding(.horizontal, 60)
                     .padding(.bottom, 40)*/
                }
            }
            .toolbar{
                ToolbarItem (placement: .topBarTrailing){
                    Button{
                        scene = .quest
                        
                    } label: {
                        Image(systemName: "house")
                            .foregroundStyle(.primary)
                            .frame(width: 50, height: 50)
                        
                    }
                    .buttonBorderShape(.circle)
                    .cornerRadius(200)
                    
                }
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
    DeerView(showButton: .constant(true), scene: .constant(.continueDeer))
}
