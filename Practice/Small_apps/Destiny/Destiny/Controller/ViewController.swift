//
//  ViewController.swift
//  Destiny
//
//  Created by Александр on 21.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var story = StoryBrain()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = story.getCurrentSituationText()
        choice1Button.setTitle(story.getCurrentChoices().0, for: .normal)
        choice2Button.setTitle(story.getCurrentChoices().1, for: .normal)
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        story.takeATurn(by: sender.currentTitle!)
        updateUI()
    }

}

