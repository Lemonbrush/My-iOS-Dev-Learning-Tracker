//
//  ViewController.swift
//  Launch Image Picker
//
//  Created by Александр on 12.02.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func experiment() {
        
        // Alert view
        let alertController = UIAlertController()
        alertController.title = "Your phone is saying"
        alertController.message = "Prrrr"
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        // Image picker
        //let nextController = UIImagePickerController()
        //present(nextController, animated: true, completion: nil)
         
        // Activity view
        //let image = UIImage()
        //let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        //present(controller, animated: true, completion: nil)
    }

}

