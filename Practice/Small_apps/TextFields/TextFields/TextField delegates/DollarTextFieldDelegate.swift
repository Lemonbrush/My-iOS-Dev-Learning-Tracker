//
//  DollarTextFieldDelegate.swift
//  TextFields
//
//  Created by Александр on 15.02.2021.
//

import Foundation
import UIKit

class DollarTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        let newTextString = String(newText)
        
        // Find and add only digits in digitText
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c in (newTextString.unicodeScalars) {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
            }
        }
        
        if let numOfPennies = Int(digitText) {
            let cents = numOfPennies % 100
            let dollars = numOfPennies/100
            
            let centsString = cents < 10 ? ("0" + String(cents)) : String(cents)
            let dollarsString = String(dollars)
            
            newText = "$" + dollarsString + "." + centsString
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty { textField.text = "$0.00" }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
