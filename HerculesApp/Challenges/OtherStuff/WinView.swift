//
//  WinView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 16/11/25.
//

import SwiftUI

struct WinView: View {
    @Binding var nextInfoView: AnyView
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
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    NavigationLink {
                        nextInfoView
                    } label: {
                        Text("Continue")
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.black)
                    .tint(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 2.0))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .controlSize(.large)
                    
                }
            }
        }
        
    }
}


#Preview {
    WinView(nextInfoView: .constant(AnyView(EndView())))
}
