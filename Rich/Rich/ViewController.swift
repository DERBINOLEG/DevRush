//
//  ViewController.swift
//  Rich
//
//  Created by Олег Дербин on 09.09.2024.
//

import SwiftUI
import UIKit


class ViewController: UIViewController {
    
//    MARK: - GUI variables
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = "I Am Rich"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "diamond")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
//    MARK: - Private Methods
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.backgroundColor = .purple
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -100),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    
    
}

#Preview {
    ViewController()
}


