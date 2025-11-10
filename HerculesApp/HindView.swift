//
//  LionView.swift
//  HerculesApp
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct HindView: View {
    var body: some View {
        VStack {
            Text("Trap the Hind!")
                .font(.title)
                .bold()
            offset(x:10, y:10)
            
            Spacer()
        }
        
        .padding()
    }
}

#Preview {
    HindView()
}
