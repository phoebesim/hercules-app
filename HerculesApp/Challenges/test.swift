//
//  test.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 20/11/25.
//

import SwiftUI

struct test: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle()
                    .tint(.black)
                WinView(nextInfoView: .constant(AnyView(AftAugeanView())))
            }
        }
    }
}

#Preview {
    test()
}
