//
//  CerberusView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 15/11/25.
//

import SwiftUI
import CoreMotion

struct CerberusView: View {
    @State private var progress: CGFloat = 0
    @StateObject private var motion = MotionDetector()
    @State private var lastStep = Date()
    var body: some View {
        ZStack {
            Image("Grass")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            if progress == 100 {
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
                    
                            NavigationLink(destination: AftCerberusView()) {
                                Text("Continue")
                                    .padding()
                                    .font(.title2.weight(.semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, minHeight: 56, )
                            }
                            .background(Color.gray)
                            .cornerRadius(12)
                            .padding(.horizontal, 60)
                            .padding(.bottom, 40)
               
                        }
                    }
                    .navigationBarBackButtonHidden()
                    .toolbar{
                        ToolbarItem (placement: .topBarLeading){
                            NavigationLink {
                                QuestView()
                            } label: {
                                Image(systemName: "house" )
                            }
                        }
                    }
                } else {
                VStack (spacing: 50) {
                    HStack {
                        Image(systemName: "figure.walk")
                            .foregroundStyle(.white)
                            .font(.title)
                        Text("Walk to bring Cerberus\nup from the Underworld!")
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
                    
                    
                    func addProgress() {
                        if progress < 100 {
                            
                            progress += 2
                        }
                    }
                }
                
                
            }
            
        }
    }
}


#Preview {
    CerberusView()
}
