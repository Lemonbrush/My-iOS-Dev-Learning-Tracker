//
//  ColorizerTextFieldDelegate.swift
//  TextFields
//
//  Created by Александр on 15.02.2021.
//

import Foundation
import UIKit

class ColorizerTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        textField.textColor = getRandomColor()
        
        return true
    }
    
    func getRandomColor() -> UIColor {
        let colors: [UIColor] = [.red, .green, .blue]
        return colors[Int.random(in:0..<colors.count)]
    }
    
}
