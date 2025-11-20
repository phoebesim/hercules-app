//
//  LoseView.swift
//  HerculesApp
//
//  Created by T Krobot on 18/11/25.
//

import SwiftUI

struct LoseView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("You Missed!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
                
                Text("The lion got away...")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Button("Try Again") {
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .padding(40)
        }
    }
}

#Preview {
    LoseView()
}
