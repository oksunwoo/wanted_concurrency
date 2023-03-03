//
//  ViewController.swift
//  wanted_concurrency
//
//  Created by Sunwoo on 2023/03/03.
//

import UIKit

class ViewController: UIViewController {
    let customView = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackgroundColor()
        makeView()
    }

    private func assignBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func makeView() {
        view.addSubview(customView)
        customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
                
        customView.configureUI()
        customView.translatesAutoresizingMaskIntoConstraints = false
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
