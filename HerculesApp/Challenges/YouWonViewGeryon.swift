//
//  YouWonView.swift
//  HerculesApp
//
//
//Created by T Krobot on 16/12/25.
//

import SwiftUI
import ConfettiSwiftUI

struct YouWonViewGeryon: View {
    @State private var confettiTrigger: Int = 0
    @Binding var scene: AppScene
    var body: some View {
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
                .padding(.horizontal, 40)
                .padding(.bottom, 45)
                
                
            }
        }
        
    }
}

#Preview {
    YouWonViewGeryon(scene: .constant(.endGeryon))
}
