//
//  ViewController.swift
//  Tipsy
//
//  Created by Александр on 21.02.2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipData = TipCalculator()
    
    // MARK: IBActions
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        // Extract percent value from the button title and get rid of the % char
        tipData.tip = Double(sender.currentTitle!.dropLast())!
        
        billTextField.endEditing(true)
    }
    
    @IBAction func steppedValueChanged(_ sender: UIStepper) {
        tipData.peopleAmount = Int(sender.value)
        splitNumberLabel.text = "\(tipData.peopleAmount)" // Or String(format: %.0f, sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let bill = Double(billTextField.text!) ?? 0.0
        tipData.calculateBill(from: bill)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateBill" {
            let resultVC = segue.destination as! ResultViewController
            
            let billPerPersonString = String(format: "%.2f", tipData.billPerPerson)
            resultVC.billPerPerson = billPerPersonString
            resultVC.settings = "Split between \(tipData.peopleAmount) people, with \(tipData.tip)% tip"
        }
    }
    
}

