//
//  ProfileView.swift
//  The Chat
//
//  Created by Гнатюк Сергей on 21.05.2021.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - UI
    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.clipsToBounds = true
        photoImageView.backgroundColor =  #colorLiteral(red: 0.8949689865, green: 0.9089159369, blue: 0.1692225933, alpha: 1)
        photoImageView.isUserInteractionEnabled = true
        photoImageView.contentMode = .scaleToFill
        return photoImageView
    }()
    
    lazy var nameTextView: UITextView = {
        let nameTextView = UITextView()
        nameTextView.textColor = .black
        nameTextView.font = .systemFont(ofSize: 24, weight: .bold)
        nameTextView.isSelectable = false
        nameTextView.isScrollEnabled = false
        nameTextView.isEditable = false
        nameTextView.returnKeyType = .done
        nameTextView.backgroundColor = .clear
        nameTextView.textAlignment = .center
        nameTextView.layer.cornerRadius = 8
        nameTextView.accessibilityIdentifier = "nameTextView"
        nameTextView.backgroundColor = .cyan
        return nameTextView
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
    
    // MARK: - Dependencies
    func setupUIElements() {
        addSubview(photoImageView)
        addSubview(nameTextView)
        setupPhotoImageViewConstraints()
        setupNameTextViewConstraints()
    }
}
