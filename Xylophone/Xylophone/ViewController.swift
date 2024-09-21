//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //    MARK: - UI Elements
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .center
        view.distribution = .fillEqually
        
        return view
    }()
    
    //    MARK: Properties
    
    var audioPlayer = AVAudioPlayer()
    let arrayCharacters = ["A", "B", "C", "D", "E", "F", "G"]
    let arrayColors: [UIColor] = [.magenta, .cyan, .blue, .green, .orange, .purple, .red]
    
    //    MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    //    MARK: - Private Methods
    
    private func createButtons() {
        for (index, character) in arrayCharacters.enumerated() {
            let multiplier = 0.9 - (0.037 * Double(index))
            let button: UIButton = {
                $0.backgroundColor = arrayColors[index]
                $0.setTitle(character, for: .normal)
                $0.layer.cornerRadius = 15
                $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
                $0.addAction(UIAction { action in
                    guard let button = action.sender as? UIButton else { return }
                    button.alpha = 0.5
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        button.alpha = 1
                    }
                    self.playSound(nameSound: character) }, for: .touchUpInside)
                
                return $0
            }(UIButton())
            
            stackView.addArrangedSubview(button)
            button.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: multiplier
            ).isActive = true
        }
    }
    
    private func playSound(nameSound: String) {
        let url = Bundle.main.url(forResource: nameSound, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
}

extension ViewController {
    
    //MARK: - Setup UI
    
    func setupUI() {
        view.addSubview(stackView)
        createButtons()
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

#Preview {
    ViewController()
}

