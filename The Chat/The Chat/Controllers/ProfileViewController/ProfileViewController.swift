//
//  ProfileViewController.swift
//  The Chat
//
//  Created by Гнатюк Сергей on 10.05.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Dependencies
    let imagePicker = UIImagePickerController()
    
    // UI
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var myJobTextField: UITextField!
    @IBOutlet var editButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Поднимаем и опускаем элементы UI когда появляется клавиатура
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        photoImageView.layer.cornerRadius = min(self.photoImageView.frame.height, self.photoImageView.frame.width) / 2.0
        photoImageView.clipsToBounds = true
        photoImageView.backgroundColor =  #colorLiteral(red: 0.8949689865, green: 0.9089159369, blue: 0.1692225933, alpha: 1)
        photoImageView.isUserInteractionEnabled = true
        photoImageView.contentMode = .scaleToFill
        imagePicker.delegate = self
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(editImageProfile(_:)))
        photoImageView.addGestureRecognizer(tapRecognizer)
        
        editButton.layer.cornerRadius = 15
    }
    // Скрываем клавиатуру при тапе по view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - @objc methods
    @objc func editImageProfile(_ sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionPhotos = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                return
            }
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(actionPhotos)
        alertController.addAction(actionCamera)
        alertController.addAction(actionCancel)
        present(alertController, animated: true, completion: nil)
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= nameTextField.minimumFontSize   //keyboardSize.height
//            }
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
}
