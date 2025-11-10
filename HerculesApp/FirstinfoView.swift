//
//  FirstinfoView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct FirstinfoView: View   {
    let textToType = "You have incurred Hera’s wrath...Because you exist. You are a result of Zeus’ infidelity. Hera tried to stop your birth. Hera tried to kill you as a baby. Hera turned you into a murderer. Hera made you a slave for your cousin and king Eurystheus. Now, you must perform 10 labours for him. You are Hercules."
    
    @State private var animatedText: String = ""
    
    var body: some View {
        VStack {
            //Image("Hercules")
            //  .resizable()
            //.aspectRatio(contentMode: .fill)
            //.ignoresSafeArea()
            //.brightness(-0.9)
            VStack {
                Text(animatedText)
                    .font(.title)
                    .padding()
            }
            .onAppear()
            
        }
        .padding()
    }
}

#Preview {
    FirstinfoView()
}
