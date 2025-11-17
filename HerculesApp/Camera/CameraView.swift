import SwiftUI
import Vision
import CoreImage
import CoreImage.CIFilterBuiltins
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    var onCapture: (UIImage) -> Void
    @Environment(\.dismiss) var dismiss // Use the new dismiss environment value
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        picker.allowsEditing = false // Set to true if you want to allow cropping
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Get the captured image
            if let uiImage = info[.originalImage] as? UIImage {
                // Pass the image back to the SwiftUI view via the binding
                parent.selectedImage = uiImage
                // Call the processing function provided by the parent view
                parent.onCapture(uiImage)
            }
            
            // Dismiss the camera view
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Dismiss the camera view if the user cancels
            parent.dismiss()
        }
    }
}
 

