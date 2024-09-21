//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    var diceArray = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"),
                    UIImage(named: "DiceThree"), UIImage(named: "DiceFour"),
                    UIImage(named: "DiceFive"),
                    UIImage(named: "DiceSix")]
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageViewOne.image = diceArray.randomElement() ?? UIImage(named: "DiceOne")
        diceImageViewTwo.image = diceArray.randomElement() ?? UIImage(named: "DiceSix")
    }
    
}

