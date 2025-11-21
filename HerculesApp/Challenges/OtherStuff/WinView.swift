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
            
                    NavigationLink(destination: nextInfoView) {
                        Text("Continue")
                            .padding()
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 56)
                    }
                    
                    .background(Color.gray)
                    .cornerRadius(12)
                    .padding(.horizontal, 60)
                    .padding(.bottom, 40)
        //            Spacer()
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
        }
    }
}

#Preview {
    WinView(nextInfoView: .constant(AnyView(EndView())))
}
