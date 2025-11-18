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
        ZStack {
            Image("Grass") // The image at the bottom
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .brightness(0.1)
                
        
        Button("Instructions") {
            showingPopover = true
        }
            
        .zIndex(2)
        .foregroundColor(.black)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .offset(x: -120, y: -370)
        .popover(isPresented: $showingPopover) {
            Text("Instructions: Scan different items based on the requirements! Complete all 12 labours to win!")
                .font(.headline)
                .padding()
        }
            VStack {
                Button{
                  BeforeLionView()
                }label: {
                    Image("Lion")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: -150)
                    
                }
                Button{
                    
                }label: {
                    Image("x")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: -150)
                    
                }
                Button{
                 BeforeHindView()
                }label: {
                    Image("Deer")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .offset(x: -150)
                    
                }
                Button{
                    
                }label: {
                    Image("x")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: -150)
                    
                }
                Button{
                 BeforeStableView()
                }label: {
                    Image("Stable")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: -150)
                    
                }
                Button{
                    
                }label: {
                    Image("StymphalianBirdFlying")
                        .resizable()
                        .frame(width: 100, height: 200)
                        .offset(x: -150)
                    
                }
            }
                VStack {
               
                Button{
                    
                }label: {
                    Image("x")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 150)
                        
                }
                Button{
                    
                }label: {
                    Image("x")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 150)
                        
                }
                Button{
                    
                }label: {
                    Image("Amazon")
                        .resizable()
                        .frame(width: 50, height: 100)
                        .offset(x: 150)
                        
                }
                Button{
                    
                }label: {
                    Image("Geryon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 150)
                        
                }
                Button{
                    
                }label: {
                    Image("x")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 150)
                        
                }
                Button{
                    
                }label: {
                    Image("Cerberus")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: 150)
                        
                }

            }
            
        
        
                
            
            
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
