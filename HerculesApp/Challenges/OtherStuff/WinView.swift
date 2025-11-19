//
//  WinView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 16/11/25.
//

import SwiftUI

struct WinView: View {
    @Binding var nextInfoView: any View
    var body: some View {
            Text("You won!!!")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.black)
                .transition(.scale)
                .zIndex(1)
            Color.white.opacity(0.85)
                .ignoresSafeArea()
                .transition(.opacity)
                .zIndex(3)
            
        
    }
}


#Preview {
    WinView(nextInfoView: .constant(AnyView(EndView())))
}
