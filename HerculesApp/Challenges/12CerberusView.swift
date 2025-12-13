//
//  CerberusView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 15/11/25.
//

import SwiftUI
import CoreMotion
import ConfettiSwiftUI

struct CerberusView: View {
    @State private var progress: CGFloat = 0
    @StateObject private var motion = MotionDetector()
    @State private var lastStep = Date()
    @State private var confettiTrigger: Int = 0

    
    @Binding var scene: AppScene
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Grass")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                if progress == 100{
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
                                scene = .endCerberus
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
                            .padding(.bottom, 40)
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
                              .padding(.bottom, 40)*/
                             
                             .background(Color.white)
                             .cornerRadius(15)
                             .foregroundColor(.black)
                             //.padding(50)
                             .padding(.horizontal, 60)
                             .padding(.bottom, 40)*/
                            
                        }
                    }
                    .navigationBarBackButtonHidden()
                } else {
                    VStack (spacing: 50) {
                        //    Slider()
                        HStack {
                            Image(systemName: "figure.walk")
                                .foregroundStyle(.white)
                                .font(.title)
                            Text("Walk around to bring Cerberus\nup from the Underworld!")
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal)
                        
                        ProgressView (value: progress, total: 100)
                            .tint(.indigo)
                            .scaleEffect(x:1, y:4)
                            .padding(.horizontal, 130)
                        Image("Cerberus")
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                    .onReceive(motion.$stepDetected) { detected in
                        guard detected else { return }
                        
                        let now = Date()
                        if now.timeIntervalSince(lastStep) > 0.25 {
                            lastStep = now
                            addProgress()
                        }
                    }
                    
                    
                }
            }
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
        
        .navigationBarBackButtonHidden(true)
        }
        
    }
    func addProgress() {
        if progress < 100 {
            
            progress += 2
            
        }
    }
}


#Preview {
    CerberusView(scene: .constant(.continueCerberus))
}
