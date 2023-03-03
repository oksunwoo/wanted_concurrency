//
//  CustomView.swift
//  wanted_concurrency
//
//  Created by Sunwoo on 2023/03/03.
//

import UIKit

final class CustomView: UIView {
    private let HStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let photo = UIImageView()
        photo.image = .init(systemName: "photo")
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    private let progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.trackTintColor = .lightGray
        progress.progressTintColor = .systemBlue
        progress.progress = 0.5
        progress.translatesAutoresizingMaskIntoConstraints = false
        
        return progress
    }()
    
    private let loadButton: UIButton = {
        let button = UIButton()
     
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.addSubview(HStack)
        HStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        HStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        HStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        HStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        HStack.addArrangedSubview(imageView)
        HStack.addArrangedSubview(progressBar)
        HStack.addArrangedSubview(loadButton)
        
        imageView.widthAnchor.constraint(equalTo: HStack.widthAnchor, multiplier: 0.3).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadButton.widthAnchor.constraint(equalTo: HStack.widthAnchor, multiplier: 0.25).isActive = true
        loadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
