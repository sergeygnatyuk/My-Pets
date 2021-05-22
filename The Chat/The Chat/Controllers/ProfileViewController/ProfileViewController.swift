//
//  ProfileViewController.swift
//  The Chat
//
//  Created by Гнатюк Сергей on 10.05.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    lazy var profileView: ProfileView = {
        let view = ProfileView()
        return view
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // цвет супервью
        view.backgroundColor = .cyan
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileView.photoImageView.layer.cornerRadius = profileView.photoImageView.layer.frame.size.width / 2
    }
    
    // MARK: - Functions
    private func setupView() {
        profileView.setupUIElements()
        profileView.backgroundColor = .white
        profileView.nameTextView.delegate = self
        imagePicker.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(editImageProfile(_:)))
        profileView.photoImageView.addGestureRecognizer(tapRecognizer)
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
}
