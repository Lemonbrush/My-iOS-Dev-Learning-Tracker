//
//  MYOAViewController.swift
//  Navigation Adventure
//
//  Created by Александр on 17.02.2021.
//

import UIKit

class MYOAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    deinit {
        print("VieController deinited")
    }
}
