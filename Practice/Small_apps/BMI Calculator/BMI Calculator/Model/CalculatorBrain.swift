//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Александр on 21.02.2021.
//

import UIKit

struct CalculatorBrain {
    
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            self.bmiValue = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            self.bmiValue = BMI(value: bmiValue, advice: "Fit as a fiddle", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            self.bmiValue = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    // MARK: Getters
    func getBMIString() -> String {
        return String(format: "%.1f", bmiValue?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "Ooops"
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? #colorLiteral(red: 1, green: 0, blue: 0.06479849268, alpha: 1)
    }
}
