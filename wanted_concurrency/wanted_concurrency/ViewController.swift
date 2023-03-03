//
//  ViewController.swift
//  wanted_concurrency
//
//  Created by Sunwoo on 2023/03/03.
//

import UIKit

class ViewController: UIViewController {
    private let customView = CustomView(url: "http://res.cloudinary.com/chelsea-production/image/upload/c_fit,h_630,w_1200/v1/site-assets/Backgrounds/Screensaver")
    
    private let VStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let loadAllButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Load All Images", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackgroundColor()
        configureUI()
    }

    private func assignBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func configureUI() {
        view.addSubview(VStack)
        VStack.addArrangedSubview(customView)
        VStack.addArrangedSubview(loadAllButton)
        
        VStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        VStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        VStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        customView.topAnchor.constraint(equalTo: VStack.topAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: VStack.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: VStack.trailingAnchor).isActive = true
                
        customView.configureUI()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        loadAllButton.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 0.7).isActive = true
        loadAllButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func loadAllImagesButtonAction(sender: UIButton) {
        customView.loadImageButtonAction(sender: sender)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
