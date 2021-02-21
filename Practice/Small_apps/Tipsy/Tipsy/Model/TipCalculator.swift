//
//  tipCalculator.swift
//  Tipsy
//
//  Created by Александр on 22.02.2021.
//

import Foundation

struct TipCalculator {
    var tip: Double = 10
    var peopleAmount = 2
    var billPerPerson: Double = 0.0
    
    mutating func calculateBill(from bill: Double) {
        let tip = self.tip / 100
        let totalCheck: Double = (bill * tip) + bill
        let billPerPerson = totalCheck / Double(peopleAmount)
        
        self.billPerPerson = billPerPerson
    }
}
