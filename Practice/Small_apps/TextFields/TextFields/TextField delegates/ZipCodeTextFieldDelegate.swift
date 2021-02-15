//
//  zipCodeTextFieldDelegate.swift
//  TextFields
//
//  Created by Александр on 15.02.2021.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count >= 5 { return false }
        
        return true
    }
}
