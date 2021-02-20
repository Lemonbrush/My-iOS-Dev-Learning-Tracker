//
//  ViewController.swift
//  Quizzler
//
//  Created by Александр on 20.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        "Four + Two is equal to Six",
        "Five - Three is greater than One",
        "Three + Eight is less then Ten"
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard questionNumber < quiz.count - 1 else { return }
        
        questionNumber += 1
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber]
    }
}

