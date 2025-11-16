//
//  WinView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 16/11/25.
//

import SwiftUI

struct WinView: View {
    var body: some View {
        Color.white.opacity(0.85)
            .ignoresSafeArea()
            .transition(.opacity)
            .zIndex(1)
            
        Text("You won!!!")
            .font(.system(size: 48, weight: .bold))
            .foregroundColor(.black)
            .transition(.scale)
            .zIndex(2)
    }
}

#Preview {
    WinView()
}
