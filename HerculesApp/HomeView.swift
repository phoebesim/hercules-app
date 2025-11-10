//
//  HomeView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//
import SwiftUI

struct HomeView: View   {
    var body: some View {
        VStack {
            
            Spacer()
            Image("Lion")
                .resizable()
                .frame(width: 80, height: 80)
                .offset(x: -135, y: 100)
            Image("Deer")
                .resizable()
                .frame(width:80, height:80)
                .offset(x: -50, y: 11)
            Text("The 12 Labours of Hercules")
                .bold()
                .font(.title)
            
            Spacer()
            
            Button("Start!") {
            
            }
            .controlSize(.extraLarge)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            
            
            
            Spacer()
            Spacer()
        }
        .padding()
        
    }
   
}

#Preview {
    HomeView()
}
