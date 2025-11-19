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
        NavigationStack {
            ZStack {
                Color.white.opacity(0.85)
                    .ignoresSafeArea()
                    .transition(.opacity)
                VStack {
                    Text("You won!!!")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                        .transition(.scale)
           /*         NavigationLink {
                        AnyView(nextInfoView)
                    } label: {
                        Text("Continue")
                    }
                    .buttonStyle(.borderedProminent)
                    .background*/
                }
            }
        }
        
    }
}


#Preview {
    WinView(nextInfoView: .constant(AnyView(EndView())))
}
