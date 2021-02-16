//
//  GameResultScreen.swift
//  Roshambo
//
//  Created by Александр on 14.02.2021.
//

import UIKit

protocol SendDataProtocol: NSObject {
    func sendDataBack(_ data: Match)
}

class GameResultScreen: UIViewController {
    
    public enum RPS: Int{ case rock = 1, paper, scissors } 
    
    var delegate: SendDataProtocol!
    var gameResult: Match!
    var playerChoice: RPS!
    
    @IBOutlet var resultDisplayView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var returnButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameResult = Match(isWon: .standoff, opponentChoice: .paper, playerChoice: .paper)
        
        gameResult.playerChoice = playerChoice
        gameResult.opponentChoice = getEnemyTurn()
        
        let displayUnits = calculeteWinner(playerTurn: playerChoice, enemyTurn: gameResult.opponentChoice)
        resultDisplayView.image = displayUnits.0
        resultLabel.text = displayUnits.1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate.sendDataBack(gameResult)
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Game mechanic
    func getEnemyTurn() -> RPS {
        return RPS(rawValue: RPS.RawValue(Int.random(in: 1...3)))!
    }
    
    
    // Make 2 different methods from this
    func calculeteWinner(playerTurn: RPS, enemyTurn: RPS) -> (UIImage, String) {
        
        var image: UIImage
        
        //Draw
        if playerTurn == enemyTurn {
            switch playerTurn {
            case .paper:
                image = UIImage(named: "paper")!
            case .rock:
                image = UIImage(named: "rock")!
            case .scissors:
                image = UIImage(named: "scissors")!
            }
            gameResult.isWon = .standoff
            return (image, "Standoff")
        }
        
        switch playerTurn {
        case .rock:
            if enemyTurn == RPS.scissors {
                image = UIImage(named: "rockScissors")!
                gameResult.isWon = .win
            } else {
                image = UIImage(named: "paperRock")!
                gameResult.isWon = .lose
            }
        case .paper:
            if enemyTurn == RPS.rock {
                image = UIImage(named: "paperRock")!
                gameResult.isWon = .win
            } else {
                image = UIImage(named: "scissorsPaper")!
                gameResult.isWon = .lose
            }
        case .scissors:
            if enemyTurn == RPS.paper {
                image = UIImage(named: "scissorsPaper")!
                gameResult.isWon = .win
            } else {
                image = UIImage(named: "rockScissors")!
                gameResult.isWon = .lose
            }
        }
        
        if gameResult.isWon == .lose {
            return (image, "You loose")
        } else if gameResult.isWon == .win {
            return (image, "You won")
        } else {
            return (image, "Standoff")
        }
    }

}
