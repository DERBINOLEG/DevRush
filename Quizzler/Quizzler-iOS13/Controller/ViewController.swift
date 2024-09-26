//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButtonPresed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! 
        let isRightAnswer = quizBrain.checkAnswer(userAnswer)
        if isRightAnswer {
            quizBrain.nextQuestion()
            sender.setTitleColor(.green, for: .normal)
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
        print(sender.backgroundColor == .green)
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(
                updateUI),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc
    func updateUI() {
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.setTitle(quizBrain.getAnswers()[0], for: .normal)
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.setTitle(quizBrain.getAnswers()[1], for: .normal)
        thirdButton.setTitleColor(.white, for: .normal)
        thirdButton.setTitle(quizBrain.getAnswers()[2], for: .normal)
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

