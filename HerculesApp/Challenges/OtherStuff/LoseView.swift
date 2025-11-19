//
//  LoseView.swift
//  HerculesApp
//
//  Created by T Krobot on 18/11/25.
//

import SwiftUI

struct LoseView: View {
    var body: some View {
        Color.white.opacity(0.85)
            .ignoresSafeArea()
            .transition(.opacity)
            .zIndex(1)
        VStack {
           
            Text("You lost..")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.black)
                .transition(.scale)
                .zIndex(2)
            
            Button {
              DeerView()
            } label: {
                Text("Restart")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                
            }
            Spacer()
        }
    }
}

#Preview {
    LoseView()
}
