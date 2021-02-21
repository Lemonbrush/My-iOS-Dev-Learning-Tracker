//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Александр on 21.02.2021.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        //var height = heightSlider.value /
        
        let height = String(format: "%.2f", heightSlider.value)
        let weight = String(format: "%.0f", weightSlider.value) // or just Int(weightSlider.value)
        
        heightLabel.text = height + "m"
        weightLabel.text = weight + "kg"
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateUI()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // BMI = Weight / (Height * Height)
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
       performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.bmiValue = calculatorBrain.getBMIString()
            resultVC.advice = calculatorBrain.getAdvice()
            resultVC.color = calculatorBrain.getColor()
        }
    }
    
}

