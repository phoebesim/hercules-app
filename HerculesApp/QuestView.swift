//
//  PathView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 11/11/25.
//

import SwiftUI

struct QuestView: View {
    
    @State private var showingPopover = false
    @State private var showingPopover1 = false
    
    var body: some View {
        
        
        Button("Instructions") {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Instructions: Scan different items based on the requirements! Press ? for more information about the game. Complete all 12 labours to win!")
                .font(.headline)
                .padding()
        }
        
        
        ZStack {
            Image(.hello) // The image at the bottom
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 600)
                .clipped()
            
            
            Button{
                
                showingPopover1 = true
            }label: {
                Image(.hera)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
            }
            .popover(isPresented: $showingPopover1) {
                VStack {
                    Text("Goddess: Marriage, childbirth and women.\nMain lover: Zeus\nAppearance: Elegant,jealous, protective and arrogant.\nWorship: Greece temples.\nKnown for: Punishing Zeus's mistresses and his other sons")
                        .font(.headline)
                        .padding()
                }
                
                
            }
            
            
        }
    }
}

#Preview {
    QuestView()
}
