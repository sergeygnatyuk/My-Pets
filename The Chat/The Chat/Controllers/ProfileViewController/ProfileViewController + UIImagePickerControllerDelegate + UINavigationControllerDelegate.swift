//
//  ProfileViewController + UIImagePickerControllerDelegate, UINavigationControllerDelegate.swift
//  The Chat
//
//  Created by Гнатюк Сергей on 14.05.2021.

import UIKit

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileView.photoImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UITextViewDelegate {
    private func textViewValidate() {
        guard let name = profileView.nameTextView.text,
              let description = profileView.descriptionTextView.text,
              !profileView.nameTextView.text.isEmpty,
              !profileView.descriptionTextView.text.isEmpty else { return }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textViewValidate()
    }
}
