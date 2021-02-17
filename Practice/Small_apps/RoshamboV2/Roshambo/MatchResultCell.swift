//
//  MatchResultCell.swift
//  Roshambo
//
//  Created by Александр on 17.02.2021.
//

import UIKit

class MatchResultCell: UITableViewCell {
    @IBOutlet weak var playerChoiceImage: UIImageView!
    @IBOutlet weak var opponentChoiceImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
