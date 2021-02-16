//
//  MatchHistoryTableView.swift
//  Roshambo
//
//  Created by Александр on 16.02.2021.
//

import UIKit

class MatchHistoryTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var matchHistoryData: [Match]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: tableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchHistoryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCellID") as! MatchResultCell
        
        let matchToShow = matchHistoryData[indexPath.row]
        cell.opponentChoiceImage.image = getPlayerResultImage(byShape: matchToShow.opponentChoice)
        cell.playerChoiceImage.image = getPlayerResultImage(byShape: matchToShow.playerChoice)
        cell.resultLabel.text = calculateWinner(player: matchToShow.playerChoice, opponent: matchToShow.opponentChoice)
        
        return cell
    }
    
    func getPlayerResultImage(byShape shape: GameResultScreen.RPS) -> UIImage {
        switch shape {
        case .paper:
            return UIImage(named: "paper")!
        case .rock:
            return UIImage(named: "rock")!
        case .scissors:
            return UIImage(named: "scissors")!
        }
    }
    
    func calculateWinner(player: GameResultScreen.RPS, opponent: GameResultScreen.RPS) -> String {
        switch (player, opponent) {
        case (.paper, .rock),(.rock, .scissors), (.scissors, .paper):
            return "You won"
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            return "You loose"
        default:
            return "Standoff"
        }
    }

}
