//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Олег Дербин on 11.10.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var peopleCount = 0
    var tipsPtc = 0
    var totalPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = "Split between \(peopleCount) people, with \(tipsPtc)% tip."
        totalLabel.text = String(totalPrice)
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
    
}
