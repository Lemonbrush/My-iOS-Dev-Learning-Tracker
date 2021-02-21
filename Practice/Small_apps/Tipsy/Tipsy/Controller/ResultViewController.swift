//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Александр on 22.02.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billPerPerson: String!
    var settings: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = billPerPerson
        settingsLabel.text = settings
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
