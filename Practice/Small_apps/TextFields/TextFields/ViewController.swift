//
//  ViewController.swift
//  TextFields
//
//  Created by Александр on 15.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var dollarTextField: UITextField!
    @IBOutlet weak var randomColorTextField: UITextField!
    
    let colorizerTextFDelegate = ColorizerTextFieldDelegate()
    let dollarTextFDelegate = DollarTextFieldDelegate()
    let zipCodeTextFDelegate = ZipCodeTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
    }
    
    func configureTextFields() {
        randomColorTextField.delegate = colorizerTextFDelegate
        dollarTextField.delegate = dollarTextFDelegate
        zipCodeTextField.delegate = zipCodeTextFDelegate
    }

    @IBAction func toggleColorTextField(_ sender: Any) {
        //randomColorTextField.isEnabled ? (randomColorTextField.isEnabled = false) : (randomColorTextField.isEnabled = true)
        
        if randomColorTextField.isEnabled {
            randomColorTextField.isEnabled = false
            randomColorTextField.placeholder = "Toggle switch button to type"
        } else {
            randomColorTextField.isEnabled = true
            randomColorTextField.placeholder = "Type to see rainbow"
        }
    }
}

