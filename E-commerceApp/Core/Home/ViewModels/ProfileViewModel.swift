//
//  ProfileViewModel.swift
//  E-commerceApp
//
//  Created by Kritchanat on 3/1/2568 BE.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profileImage: Image = Image(systemName: "person.crop.circle.fill")
    @Published var firstName: String = "Sabrina"
    @Published var lastName: String = "Aryan"
    @Published var username: String = "@Sabrina"
    @Published var email: String = "SabrinaAry208@gmail.com"
    @Published var phoneNumber: String = "+234 904 6470"
    @Published var birthDate: Date = Date()
    @Published var gender: String = "Female"

    func saveChanges() {
        print("Profile saved successfully.")
    }
}

// ImagePicker Implementation 
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Image

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
