//
//  ViewController.swift
//  Roshambo
//
//  Created by Александр on 13.02.2021.
//

import UIKit

public struct Match {
    enum gameResult { case win, lose, standoff }
    
    var isWon: gameResult
    var opponentChoice: GameResultScreen.RPS
    var playerChoice: GameResultScreen.RPS
}

class ViewController: UIViewController, SendDataProtocol {
    
    @IBOutlet var rockButton: UIButton!      // Code
    @IBOutlet var paperButton: UIButton!     // Code & Segue
    @IBOutlet var scissorsButton: UIButton!  // Segue

    @IBOutlet weak var matchHistoryButton: UIButton!
    
    var matchHistory = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchHistoryButton.layer.cornerRadius = 10
    }
    
    func sendDataBack(_ data: Match) {
        matchHistory.append(data)
    }
    
    // This ViewController presentation implemented with only code
    @IBAction func rockChoice(_ sender: Any) {
        
        let gameResultScreen = storyboard?.instantiateViewController(withIdentifier: "resultScreen") as! GameResultScreen
        gameResultScreen.playerChoice = getUserChoice(sender as! UIButton)
        gameResultScreen.delegate = self
            
        present(gameResultScreen, animated: true, completion: nil)
    }
    
    // This ViewController presentation implemented with some code and segue
    // prepare for segue executes before this
    @IBAction func paperChoice(_ sender: Any) {
        performSegue(withIdentifier: "resultShow", sender: sender)
    }
    
    // Only segue situation handles with prepare for segue
    // the segue implemented with storyboard but it still has the message to send so it hapens here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier
        {
        case "resultShow":
            let controller = segue.destination as! GameResultScreen
            controller.playerChoice = getUserChoice(sender as! UIButton)
            controller.delegate = self
        case "matchResults":
            let controller = segue.destination as! MatchHistoryTableView
            controller.matchHistoryData = matchHistory
        default: break
        }
        
        
    }
    
    // Helper - gives user's choice 
    func getUserChoice(_ sender: UIButton) -> GameResultScreen.RPS {
        switch sender {
        case rockButton:
            return GameResultScreen.RPS.rock
        case paperButton:
            return GameResultScreen.RPS.paper
        case scissorsButton:
            return GameResultScreen.RPS.scissors
        default:
            return GameResultScreen.RPS.rock // But that won't happen
        }
    }

}

