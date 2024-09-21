//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: - UI Elements
    
    private let ballView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ball1")
        view.contentMode = .scaleAspectFill
        
        
        return view
    }()
    
    private lazy var getAnswerPress = {
        let button = UIButton()
        
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Answer", for: .normal)
        button.layer.cornerRadius = 9
        button.addTarget(self, action: #selector(getAnswer), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var label: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Get Answer"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 27, weight: .bold)
        $0.adjustsFontSizeToFitWidth = true
        
        return $0
    }(UILabel())
    
    
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //    MARK: - Objc
    
    @objc func getAnswer() {
        let ballsArray = [
            UIImage(named: "ball1"),
            UIImage(named: "ball2"),
            UIImage(named: "ball3"),
            UIImage(named: "ball4"),
            UIImage(named: "ball5")
        ]
        
        let bla = ballsArray.randomElement()
//        guard let bla = ballsArray.randomElement() else { return }
//        ballView.image = bla
        
        if bla != nil {
            ballView.image = bla!
        }
        
    }
    
    
    
}


//MARK:  - SetupUI
extension ViewController {
    
    
    func setupUI() {
        view.backgroundColor = .cyan
        
        view.addSubviews(ballView, label, getAnswerPress)
        setupConstraints()
    }
    
    //    MARK: - Setup Constraints
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            ballView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ballView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            ballView.heightAnchor.constraint(equalTo: ballView.widthAnchor),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: ballView.topAnchor, constant: -60),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            getAnswerPress.topAnchor.constraint(equalTo: ballView.bottomAnchor, constant: 90),
            getAnswerPress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getAnswerPress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120)
            
        ])
        
    }
    
}




extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}


#Preview {
    ViewController()
}

