//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Олег Дербин on 30.09.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .systemRed)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .systemRed)
        }
        
    }
    
    func getBMIValue() -> String {
        String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        bmi?.color ?? .blue
    }
}
