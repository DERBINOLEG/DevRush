//
//  ViewController.swift
//  Poor
//
//  Created by Олег Дербин on 11.09.2024.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    //    MARK: - UI Elements
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I Am Poor"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .thin)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "coal")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
}

//MARK: - UI Setup

extension ViewController {
    
    func setupUI() {
        view.backgroundColor = .cyan
        view.addSubview(firstLabel)
        view.addSubview(imageView)
        setupConstraints()
    }
}

//MARK: - Constraints

extension ViewController {
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 170),
            firstLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8),
            
            imageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 80),
            imageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.8)
        ])
    }
}



#Preview {
    ViewController()
}
