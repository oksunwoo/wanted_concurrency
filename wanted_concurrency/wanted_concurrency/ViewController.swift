//
//  ViewController.swift
//  wanted_concurrency
//
//  Created by Sunwoo on 2023/03/03.
//

import UIKit

class ViewController: UIViewController {
    private let customView1 = CustomView(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWj540Ioqtyczubk2B8zPc4WPWSDwMBT4wuw&usqp=CAU")
    private let customView2 = CustomView(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrZEm9QsCm54DT5jfS-_YGlVJFBl63d3bdQg&usqp=CAU")
    private let customView3 = CustomView(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlBjwp0xeSW0R126X0eFFVBigqy1N181tK6A&usqp=CAU")
    private let customView4 = CustomView(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4AFeoSIrDLUnfgR49w-Ht25i_KO-9sQYCeQ&usqp=CAU")
    private let customView5 = CustomView(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRySaJkItIbpg2V0o9iQ64tWtgK6Wk_Hj881w&usqp=CAU")
    
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
        button.addTarget(self, action: #selector(loadAllImagesButtonAction), for: .touchUpInside)
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
        VStack.addArrangedSubview(customView1)
        VStack.addArrangedSubview(customView2)
        VStack.addArrangedSubview(customView3)
        VStack.addArrangedSubview(customView4)
        VStack.addArrangedSubview(customView5)
        VStack.addArrangedSubview(loadAllButton)
        
        VStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        VStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        VStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        customView1.topAnchor.constraint(equalTo: VStack.topAnchor).isActive = true
        customView1.leadingAnchor.constraint(equalTo: VStack.leadingAnchor).isActive = true
        customView1.trailingAnchor.constraint(equalTo: VStack.trailingAnchor).isActive = true
                
        customView1.configureUI()
        customView1.translatesAutoresizingMaskIntoConstraints = false
        
        customView2.topAnchor.constraint(equalTo: customView1.bottomAnchor).isActive = true
        customView2.leadingAnchor.constraint(equalTo: VStack.leadingAnchor).isActive = true
        customView2.trailingAnchor.constraint(equalTo: VStack.trailingAnchor).isActive = true
                
        customView2.configureUI()
        customView2.translatesAutoresizingMaskIntoConstraints = false
        
        customView3.topAnchor.constraint(equalTo: customView2.bottomAnchor).isActive = true
        customView3.leadingAnchor.constraint(equalTo: VStack.leadingAnchor).isActive = true
        customView3.trailingAnchor.constraint(equalTo: VStack.trailingAnchor).isActive = true
                
        customView3.configureUI()
        customView3.translatesAutoresizingMaskIntoConstraints = false
        
        customView4.topAnchor.constraint(equalTo: customView3.bottomAnchor).isActive = true
        customView4.leadingAnchor.constraint(equalTo: VStack.leadingAnchor).isActive = true
        customView4.trailingAnchor.constraint(equalTo: VStack.trailingAnchor).isActive = true
                
        customView4.configureUI()
        customView4.translatesAutoresizingMaskIntoConstraints = false
        
        customView5.topAnchor.constraint(equalTo: customView4.bottomAnchor).isActive = true
        customView5.leadingAnchor.constraint(equalTo: VStack.leadingAnchor).isActive = true
        customView5.trailingAnchor.constraint(equalTo: VStack.trailingAnchor).isActive = true
                
        customView5.configureUI()
        customView5.translatesAutoresizingMaskIntoConstraints = false
        
        loadAllButton.widthAnchor.constraint(equalTo: customView1.widthAnchor, multiplier: 0.7).isActive = true
        loadAllButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func loadAllImagesButtonAction(sender: UIButton) {
        customView1.loadImageButtonAction(sender: sender)
        customView2.loadImageButtonAction(sender: sender)
        customView3.loadImageButtonAction(sender: sender)
        customView4.loadImageButtonAction(sender: sender)
        customView5.loadImageButtonAction(sender: sender)
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
