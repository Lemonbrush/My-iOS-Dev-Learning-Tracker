//
//  ViewController.swift
//  Click Counter
//
//  Created by Александр on 12.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label: UILabel!
    //var secondLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // Label
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        view.addSubview(label)
        self.label = label
        
        // SecondLabel
        let secondLabel = UILabel()
        secondLabel.frame = CGRect(x: 150, y: 150, width: 60, height: 60)
        secondLabel.text = "0"
        secondLabel.frame.origin.x += 20
        view.addSubview(secondLabel)
        self.secondLabel = secondLabel
        
        // Button
        let button = UIButton()
        button.frame = CGRect(x: 150, y: 250, width: 60, height: 60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControl.Event.touchUpInside)
        button.addTarget(self, action: #selector(ViewController.toggleBackgroundColor), for: UIControl.Event.touchUpInside)
         */
    }
    
    @IBAction func incrementCount() {
        self.count += 1
        self.label.text = "\(self.count)"
        //self.secondLabel.text = "\(self.count)"
    }
    
    /*
    @objc func toggleBackgroundColor() {
        if view.backgroundColor != UIColor.blue
        {
            view.backgroundColor = .blue
        } else {
            view.backgroundColor = .white
        }
    }
     */
}

