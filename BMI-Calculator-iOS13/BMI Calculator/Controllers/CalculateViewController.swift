//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func heightSliderAction(_ sender: UISlider) {
//        let number = sender.value
//        let roundedNumber = round(number * 100) / 100
//        print(roundedNumber)
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    @IBAction func weightSliderAction(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "Kg"
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculateBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as? ResultViewController
            destinationVC?.bmiValue = calculateBrain.getBMIValue()
            destinationVC?.advice = calculateBrain.getAdvice()
            destinationVC?.color = calculateBrain.getColor()
        }
    }
    

}

