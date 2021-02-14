//
//  ViewController.swift
//  Roshambo
//
//  Created by Александр on 13.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rockButton: UIButton! // Code
    @IBOutlet var paperButton: UIButton! // Code & Segue
    @IBOutlet var scissorsButton: UIButton! // Segue
    
    public enum RPS: Int{ case rock = 1, paper, scissors }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeATurn(_ sender: Any) {
        let button = sender as! UIButton
        
        switch button {
        case rockButton:
            // Process game logic
            let result = self.calculeteWinner(playerTurn: RPS.rock, enemyTurn: self.getEnemyTurn())
            let gameResultScreen = storyboard?.instantiateViewController(withIdentifier: "resultScreen") as! GameResultScreen
            gameResultScreen.mainLabelText = result.1
            gameResultScreen.mainImage = result.0
            
            present(gameResultScreen, animated: true, completion: nil)
        case paperButton:
            performSegue(withIdentifier: "resultShow", sender: sender)
        default:
            break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let result: (UIImage, String)
        
        switch sender as! UIButton {
        case paperButton:
            result = self.calculeteWinner(playerTurn: RPS.paper, enemyTurn: self.getEnemyTurn())
        default:
            result = self.calculeteWinner(playerTurn: RPS.scissors, enemyTurn: self.getEnemyTurn())
        }
        
        let controller = segue.destination as! GameResultScreen
        controller.mainLabelText = result.1
        controller.mainImage = result.0
        
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

