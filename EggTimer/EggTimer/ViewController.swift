//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //    MARK: - UI Elements
    private let verticalStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    private let titleLabel: UILabel = {
        $0.text = "How do you like your eggs?"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let horizontalStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.alignment = .center
        return $0
    }(UIStackView())
    
    private let progressBar: UIProgressView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.progressTintColor = .yellow
        $0.trackTintColor = .systemGray
        return $0
    }(UIProgressView())
    
    
    private let softButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "soft_egg"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        return $0
    }(UIButton())
    
    private let mediumButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "medium_egg"), for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        return $0
    }(UIButton())
    
    private let hardButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "hard_egg"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        return $0
    }(UIButton())
    
    private let viewTimer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    //    MARK: - Properties
    
    private var timer: Timer?
    private var fullTime = 0
    private var passedTime = 0
    private var audioPlayer: AVAudioPlayer?
    
    
    //    MARK: -Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setButtonsActions()
    }
    
    //    MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = UIColor(red: 210 / 255, green: 241 / 255, blue: 251 / 255, alpha: 1)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(viewTimer)
        viewTimer.addSubview(progressBar)
        horizontalStackView.addArrangedSubview(softButton)
        horizontalStackView.addArrangedSubview(mediumButton)
        horizontalStackView.addArrangedSubview(hardButton)
        setupConstraints()
    }
    //    MARK: - Setup Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            progressBar.centerYAnchor.constraint(equalTo: viewTimer.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 10),
            progressBar.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -10)
        ])
    }
    
    //    MARK: - Methods
    
    private func setButtonsActions() {
        softButton.addAction(UIAction { [weak self] _ in self?.startTimer(300) }, for: .touchUpInside)
        mediumButton.addAction(UIAction { [weak self] _ in self?.startTimer(420) }, for: .touchUpInside)
        hardButton.addAction(UIAction { [weak self] _ in self?.startTimer(720) }, for: .touchUpInside)
    }
    
    private func startTimer(_ time: Int) {
        fullTime = time
        passedTime = 0
        progressBar.progress = 0
        titleLabel.text = "How do you like your eggs?"
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerSelector),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    private func timerSelector() {
        if passedTime < fullTime {
            passedTime += 1
            progressBar.progress = Float(passedTime) / Float(fullTime)
        } else {
            playSound()
            titleLabel.text = "Done!"
            timer?.invalidate()
        }
    }
    
    private func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer?.play()
    }
}



#Preview {
    ViewController()
}
