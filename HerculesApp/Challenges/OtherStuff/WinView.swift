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
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack(spacing: 24) {
                    Spacer()
                    
                    
                    Text("You won!!!")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: nextInfoView) {
                        Text("Continue")
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 56)
                    }
                    
                    .background(Color.gray)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
            }
            .navigationBarBackButtonHidden()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WinView(nextInfoView: .constant(AnyView(EndView())))
}
