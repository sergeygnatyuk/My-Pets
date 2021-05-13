//
//  ProfileViewController.swift
//  The Chat
//
//  Created by Гнатюк Сергей on 10.05.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Dependencies
    var imagePicker = UIImagePickerController()
    // UI
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = min(self.imageView.frame.height, self.imageView.frame.width) / 2.0
        imageView.clipsToBounds = true
        imageView.backgroundColor =  #colorLiteral(red: 0.8949689865, green: 0.9089159369, blue: 0.1692225933, alpha: 1)
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleToFill
        imagePicker.delegate = self
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_:)))
        imageView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapOnImage(_ sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionPhotos = UIAlertAction(title: "Photo Library", style: .default) { (alertController) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (alertController) in
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
}
