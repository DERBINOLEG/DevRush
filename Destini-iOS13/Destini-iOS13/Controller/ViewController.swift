//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewUI = View()
    var storyBrain = StoryBrain()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = viewUI
        updateUI()
        setupButtons()
    }
    
    
    private func setupButton(_ button: UIButton) {
        button.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.pressButton(sender: button)
        }, for: .touchUpInside)
    }
    
    private func pressButton(sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        storyBrain.nextStory(choiceButton: buttonTitle)
        updateUI()
    }
    
    private func setupButtons() {
        setupButton(viewUI.choice1Button)
        setupButton(viewUI.choice2Button)
    }
    
    
    private func updateUI() {
        viewUI.storyLabel.text = storyBrain.getStory()
        viewUI.choice1Button.setTitle(storyBrain.getChoice()[0], for: .normal)
        viewUI.choice2Button.setTitle(storyBrain.getChoice()[1], for: .normal)
        
    }
    
}

#Preview {
 ViewController()
}

