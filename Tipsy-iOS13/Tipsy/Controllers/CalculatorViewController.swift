//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    private var tipsPtc: Double = 0.1
    private var peopleCount: Double = 1
    private var price: Double = 0
    private var totalPrice = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        [zeroPctButton, tenPctButton, twentyPctButton].forEach { $0?.isSelected = false }
        sender.isSelected = true
        switch sender {
        case zeroPctButton: tipsPtc = 0
        case tenPctButton: tipsPtc = 0.1
        default: tipsPtc = 0.2
        }
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peopleCount = sender.value
        sender.minimumValue = 1
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalPrice = calculatePrice()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        
    }
    
    private func calculatePrice() -> String {
        var priceForPerson: Double = 0
        if let bildText = billTextField.text, let billAmount = Double(bildText) {
            price = billAmount
            let tips = price * tipsPtc
            priceForPerson = (price + tips) / peopleCount
        }
        return String(format: "%.2f", priceForPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultScreen",
            let vc = segue.destination as? ResultViewController {
            vc.peopleCount = Int(self.peopleCount)
            vc.tipsPtc = Int(tipsPtc * 100)
            vc.totalPrice = self.totalPrice
        }
    }
}
