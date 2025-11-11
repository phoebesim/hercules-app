//
//  GameAssetCaptureView.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 11/11/25.
//

import SwiftUI
import UIKit
struct GameAssetCaptureView: View {
    @State private var capturedUIImage: UIImage?
    @State private var isShowingCamera = false

    var body: some View {
        VStack {
            if let image = capturedUIImage {
                // Display the image you captured
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .ignoresSafeArea()
                
                Text("Asset Captured!")
                    .padding(.top)
            } else {
                Text("Tap to scan your game asset.")
            }
            
            Button("Open Camera") {
                self.isShowingCamera = true
            }
            .padding()
            
        }
        .sheet(isPresented: $isShowingCamera) {
                        CameraPicker { capturedImage in
                self.capturedUIImage = capturedImage
                self.isShowingCamera = false
            }
        }
    }
}

#Preview {
    GameAssetCaptureView()
}
