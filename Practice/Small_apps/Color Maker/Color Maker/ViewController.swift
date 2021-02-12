//
//  ViewController.swift
//  Color Maker
//
//  Created by Александр on 12.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 32
        colorView.layer.shadowColor = UIColor.black.cgColor
        colorView.layer.shadowOpacity = 0.10
        colorView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        changeColor(self)
    }
    
    
    @IBAction func changeColor(_ sender: Any) {
        let r = CGFloat(redSlider.value)
        let g = CGFloat(greenSlider.value)
        let b = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

