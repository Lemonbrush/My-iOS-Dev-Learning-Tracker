//
//  GameResultScreen.swift
//  Roshambo
//
//  Created by Александр on 14.02.2021.
//

import UIKit

class GameResultScreen: UIViewController {
    
    var mainLabelText: String!
    var mainImage: UIImage!
    
    @IBOutlet var resultDisplayView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var returnButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = mainLabelText
        resultDisplayView.image = mainImage

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
