//
//  ContentView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 7/11/25.
//

import SwiftUI
struct ContentView: View {
    @State private var showingPopover = false
    
    
    
    var body: some View {
        
        Button("Instructions") {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Instructions: Scan different items based on the requirements! Press ? for more information about the game. Complete all 12 labours to win!")
                .font(.headline)
                .padding()
        }
        
        ZStack{
            Image(.hello)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 700)
        }
        
        VStack{
            Button("Start Game") {
                
                
                
                
                
                
                
                
                
            }
            
        }
        
    }
    
}
#Preview {
    ContentView()
}
