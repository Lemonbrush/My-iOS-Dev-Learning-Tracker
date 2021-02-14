//
//  GameResultScreen.swift
//  Roshambo
//
//  Created by Александр on 14.02.2021.
//

import UIKit

class GameResultScreen: UIViewController {
    
    var playerChoice: RPS!
    
    public enum RPS: Int{ case rock = 1, paper, scissors }
    
    @IBOutlet var resultDisplayView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var returnButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let displayUnits = calculeteWinner(playerTurn: playerChoice, enemyTurn: getEnemyTurn())
        resultDisplayView.image = displayUnits.0
        resultLabel.text = displayUnits.1
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getEnemyTurn() -> RPS {
        return RPS(rawValue: RPS.RawValue(Int.random(in: 1...3)))!
    }
    
    func calculeteWinner(playerTurn: RPS, enemyTurn: RPS) -> (UIImage, String) {
        //Draw
        if playerTurn == enemyTurn {
            let image: UIImage
            switch playerTurn {
            case .paper:
                image = UIImage(named: "paper")!
            case .rock:
                image = UIImage(named: "rock")!
            case .scissors:
                image = UIImage(named: "scissors")!
            }
            return (image, "Standoff")
        }
        
        var image: UIImage
        var message: String
        
        switch playerTurn {
        case .rock:
            if enemyTurn == RPS.scissors {
                image = UIImage(named: "rockScissors")!
                message = "You win"
            } else {
                image = UIImage(named: "paperRock")!
                message = "You lose"
            }
        case .paper:
            if enemyTurn == RPS.rock {
                image = UIImage(named: "paperRock")!
                message = "You win"
            } else {
                image = UIImage(named: "scissorsPaper")!
                message = "You lose"
            }
        case .scissors:
            if enemyTurn == RPS.paper {
                image = UIImage(named: "scissorsPaper")!
                message = "You win"
            } else {
                image = UIImage(named: "rockScissors")!
                message = "You lose"
            }
        }
        
        return (image, message)
    }

}
