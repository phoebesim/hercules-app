//
//  AugeanView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 12/11/25.
//

import SwiftUI

struct Pipe: Identifiable {
  //  var type: PipeType
    let id = UUID()
    var rotation: Int
    var isFilled: Bool = false
}
enum PipeType {
    case straight, corner, end, T
}


struct AugeanView: View {
    var body: some View {
        ZStack {
            Image(.grass)
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .frame(width: 500, height: 500)
            Image(.dirt)
                .resizable()
                .frame(width:450, height: 450)
                .offset(x:-80, y: 70)
            Image(.dirt)
                .resizable()
                .frame(width:450, height: 450)
                .offset(x:85, y: -60)
            
        }
    }
}

#Preview {
    AugeanView()
}
