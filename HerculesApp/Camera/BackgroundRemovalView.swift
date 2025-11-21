import SwiftUI
import Vision
import CoreImage
import CoreImage.CIFilterBuiltins
import AVFoundation

struct BackgroundRemovalView: View {
    @State private var processedImage: UIImage?
    @State private var showingCamera = false
    
    var onDone: (UIImage?) -> Void
    
    
    // Create a shared CIContext instance once for efficiency
    private let ciContext = CIContext()
    
    var body: some View {
        VStack {
            if let displayImage = processedImage {
                Image(uiImage: displayImage)
                    .resizable()
                    .scaledToFit()
                    .padding()
               //     .rotationEffect(Angle(degrees: 90))
            } else {
                Text("Tap the button to take a photo.")
                    .font(.headline)
                    .padding()
            }
            
            Button("􀌞") {
                // Check if camera is available before presenting
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    showingCamera = true
                } else {
                    print("Camera not available on this device/simulator.")
                }
            }
        }
        .sheet(isPresented: $showingCamera) {
            // Present the CameraView when showingCamera is true
            CameraView(selectedImage: $processedImage, onCapture: handleCapturedImage)
                .ignoresSafeArea()
        }
    }
    
    private func handleCapturedImage(_ capturedImage: UIImage) {
        // This function is called when the user takes a photo
        Task {
            if let inputCIImage = CIImage(image: capturedImage) {
                guard let maskImage = createMask(from: inputCIImage) else {
                    print("Failed to create mask")
                    return
                }
                
                let outputImage = applyMask(mask: maskImage, to: inputCIImage)
                
                await MainActor.run {
                    self.processedImage = convertToUIImage(ciImage: outputImage)
                    onDone(self.processedImage)
                }
            }
        }
    }
    
    // MARK: - Core Image & Vision Helper Functions (from your original code)
    
    private func createMask(from inputImage: CIImage) -> CIImage? {
        let request = VNGenerateForegroundInstanceMaskRequest()
        let handler = VNImageRequestHandler(ciImage: inputImage, options: [:])
        
        do {
            try handler.perform([request])
            if let result = request.results?.first {
                let maskPixelBuffer = try result.generateScaledMaskForImage(
                    forInstances: result.allInstances,
                    from: handler
                )
                return CIImage(cvPixelBuffer: maskPixelBuffer)
            }
        } catch {
            print("Error generating mask: \(error.localizedDescription)")
        }
        return nil
    }
    
    private func applyMask(mask: CIImage, to inputImage: CIImage) -> CIImage {
        // The following line causes the error because blendWithMask() is non-optional:
        // guard let filter = CIFilter.blendWithMask() else { return inputImage }
        
        // Correct way: use 'let' because it always returns a filter instance
        let filter = CIFilter.blendWithMask()
        
        filter.inputImage = inputImage
        filter.maskImage = mask
        filter.backgroundImage = CIImage.empty()
        
        // The outputImage *is* still optional, so keep the guard/if let here
        guard let outputImage = filter.outputImage else { return inputImage }
        return outputImage
    }
    
    
    private func convertToUIImage(ciImage: CIImage) -> UIImage? {
        guard let cgImage = ciContext.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }
}

#Preview {
    BackgroundRemovalView { finalImage in
        print("done", finalImage != nil)
    }
}
