//
//  ProfileView.swift
//  The Chat
//
//  Created by Гнатюк Сергей on 21.05.2021.
//

import UIKit

class ProfileView: UIView {
    
    // Properties
    let nameTextViewIdentifier = "nameTextView"
    let descriptionTextViewIdentifier = "descriptionTextView"
    
    // MARK: - UI
    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.clipsToBounds = true
        photoImageView.backgroundColor =  UIColor().colorFromHex("#E4E72B")
        photoImageView.isUserInteractionEnabled = true
        photoImageView.contentMode = .scaleToFill
        return photoImageView
    }()
    
    lazy var nameTextView: UITextView = {
        let nameTextView = UITextView()
        nameTextView.textColor = .black
        nameTextView.font = .systemFont(ofSize: 24, weight: .bold)
//        nameTextView.isSelectable = false
        nameTextView.isScrollEnabled = false
//        nameTextView.isEditable = false
        nameTextView.returnKeyType = .done
        nameTextView.backgroundColor = .clear
        nameTextView.textAlignment = .center
        nameTextView.layer.cornerRadius = 8
        nameTextView.accessibilityIdentifier = nameTextViewIdentifier
        return nameTextView
    }()
    
    lazy var descriptionTextView: UITextView = {
       let descriptionTextView = UITextView()
        descriptionTextView.textColor = .black
        descriptionTextView.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.returnKeyType = .done
        descriptionTextView.keyboardDismissMode = .interactive
//        descriptionTextView.keyboardAppearance = .light
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.accessibilityIdentifier = descriptionTextViewIdentifier
        return descriptionTextView
    }()
    
    // MARK: - Constraints
    private func setupPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 1),
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupNameTextViewConstraints() {
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextView.heightAnchor.constraint(equalToConstant: 40),
            nameTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nameTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            nameTextView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 32)
        ])
    }
    
    private func setupDescriptionTextViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.heightAnchor.constraint(equalToConstant: 40),
            descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            descriptionTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 32),
            
           // descriptionTextView.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -250)
        ])
    }
    
    // MARK: - Dependencies
    func setupUIElements() {
        addSubview(photoImageView)
        addSubview(nameTextView)
        addSubview(descriptionTextView)
        setupPhotoImageViewConstraints()
        setupNameTextViewConstraints()
        setupDescriptionTextViewConstraints()
    }
}
