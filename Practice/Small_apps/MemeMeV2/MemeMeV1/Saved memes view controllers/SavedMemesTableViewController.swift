//
//  SavedMemesViewController.swift
//  MemeMeV1
//
//  Created by Александр on 18.02.2021.
//

import UIKit

class SavedMemesTableViewController: UIViewController {
    
    // Access to the data from appDelegate
    var memes: [Meme] {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
