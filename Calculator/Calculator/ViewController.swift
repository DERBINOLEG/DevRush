//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: - UI Elements
    
    private let firstStack = CustomStack()
    private let secondStack = CustomStack()
    private let thirdStack = CustomStack()
    private let fourthStack = CustomStack()
    private let fifthStack = CustomStack()
    private let topLabel: UILabel = {
        $0.text = "0"
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        
        return $0
    }(UILabel())
    private let oneButton = CustomBotton(text: "1", color: .blue)
    private let twoButton = CustomBotton(text: "2", color: .blue)
    private let threeButton = CustomBotton(text: "3", color: .blue)
    private let fourButton = CustomBotton(text: "4", color: .blue)
    private let fiveButton = CustomBotton(text: "5", color: .blue)
    private let sixButton = CustomBotton(text: "6", color: .blue)
    private let sevenButton = CustomBotton(text: "7", color: .blue)
    private let eightButton = CustomBotton(text: "8", color: .blue)
    private let nineButton = CustomBotton(text: "9", color: .blue)
    private let pointButton = CustomBotton(text: ".", color: .blue)
    private let plusMinusButton = CustomBotton(text: "+/-", color: .gray)
    private let procentButton = CustomBotton(text: "%", color: .gray)
    private let acButton = CustomBotton(text: "AC", color: .gray)
    private let plusButton = CustomBotton(text: "+", color: .orange)
    private let minusButton = CustomBotton(text: "-", color: .orange)
    private let multiplierButton = CustomBotton(text: "*", color: .orange)
    private let equalButton = CustomBotton(text: "=", color: .orange)
    private let devisionButton = CustomBotton(text: "÷", color: .orange)
    private let zeroButton = CustomBotton(text: "0", color: .blue)
    private let bottomStack = CustomStack()
    private let topView = UIView()
    
    
    
    
    
    private let baseStackView: UIStackView = {
        let view = UIStackView()
        
        view.distribution = .fillEqually
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .cyan
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    //    MARK: - Setup UI
    
    func setupUI() {
        view.addSubview(baseStackView)
        topView.addSubview(topLabel)
        baseStackView.addArrangedSubview(topView)
        baseStackView.addArrangedSubview(firstStack)
        baseStackView.addArrangedSubview(secondStack)
        baseStackView.addArrangedSubview(thirdStack)
        baseStackView.addArrangedSubview(fourthStack)
        baseStackView.addArrangedSubview(fifthStack)
        firstStack.addArrangedSubview(procentButton)
        firstStack.addArrangedSubview(plusMinusButton)
        firstStack.addArrangedSubview(acButton)
        firstStack.addArrangedSubview(devisionButton)
        secondStack.addArrangedSubview(sevenButton)
        secondStack.addArrangedSubview(eightButton)
        secondStack.addArrangedSubview(nineButton)
        secondStack.addArrangedSubview(multiplierButton)
        thirdStack.addArrangedSubview(fourButton)
        thirdStack.addArrangedSubview(fiveButton)
        thirdStack.addArrangedSubview(sixButton)
        thirdStack.addArrangedSubview(minusButton)
        fourthStack.addArrangedSubview(oneButton)
        fourthStack.addArrangedSubview(twoButton)
        fourthStack.addArrangedSubview(threeButton)
        fourthStack.addArrangedSubview(plusButton)
        fifthStack.addArrangedSubview(zeroButton)
        bottomStack.addArrangedSubview(pointButton)
        bottomStack.addArrangedSubview(equalButton)
        fifthStack.addArrangedSubview(bottomStack)
        
        
        
        setupConstraints()
    }
    
    //    MARK: - Setup Constraints
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            topLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            topLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            topLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            topLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
    }
    
    
}

final class CustomStack: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStack() {
        distribution = .fillEqually
        alignment = .fill
        axis = .horizontal
        spacing = 1
    }
}

final class CustomBotton: UIButton {
    let text: String
    let color: UIColor
    
    init(text: String, color: UIColor) {
        self.text = text
        self.color = color
        super.init(frame: .zero)
        createButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton() {
        setTitle(text, for: .normal)
        backgroundColor = color
        setTitleColor(.white, for: .normal)
    }
}


#Preview {
    ViewController()
}
