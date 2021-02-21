//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Александр on 21.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var advice: String?
    var color: UIColor?
    var bmiValue: String?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice!
        
        view.backgroundColor = color!
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
