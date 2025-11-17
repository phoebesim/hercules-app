//Camera Picker by Emerald Code:

import SwiftUI
struct CameraPicker: UIViewControllerRepresentable {
    var completion: (_ image: UIImage?) -> Void
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        
        // Use the camera if available, otherwise use the photo library for the simulator
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            
        } else {
            picker.sourceType = .photoLibrary
        }
        
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraPicker

        init(parent: CameraPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as? UIImage
            parent.completion(image)
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.completion(nil)
            picker.dismiss(animated: true)
        }
    }
}

