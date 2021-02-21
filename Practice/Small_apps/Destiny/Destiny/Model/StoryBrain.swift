//
//  StoryBrain.swift
//  Destiny
//
//  Created by Александр on 21.02.2021.
//

import Foundation

struct StoryBrain {
    let situations = [
        Story("Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and says: \"Need a ride, boy?",
              c1: "I'll hop in. Thanks for the help!",
              leadsTo: 1,
              c2: "Well, I don't have many options. Better ask him if he's a murderer.",
              leadsTo: 4),
        Story("As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
              c1: "I love Elton John! Hand him the cassette tape.",
              leadsTo: 2,
              c2: "It’s him or me. Take the knife and stab him.",
              leadsTo: 3),
        Story("You bond with the murderer while crooning verses of \("Can you feel the love tonight"). He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \("Try the pier")",
              c1: "The",
              leadsTo: 0,
              c2: "End",
              leadsTo: 0),
        Story("As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
              c1: "The",
              leadsTo: 0,
              c2: "End",
              leadsTo: 0),
        Story("He nods slowly, unphased by the question.",
              c1: "At least he's honest. I'll climb in.",
              leadsTo: 1,
              c2: "Wait, I know how to change a tire.",
              leadsTo: 5),
        Story("What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?",
              c1: "The",
              leadsTo: 0,
              c2: "End",
              leadsTo: 0)
    ]
    
    var currentSituation = 0
    
    mutating func takeATurn(by choice: String) {
        
        let situation = situations[currentSituation]
        let choices = getCurrentChoices()
        
        if choice == choices.0 {
            if let result = situation.choice1[choice]! {
                currentSituation = result
            }
        } else if choice == choices.1 {
            if let result = situation.choice2[choice]! {
                currentSituation = result
            }
        }
        
    }
    
    // MARK: Getters
    func getCurrentChoices() -> (String, String) {
        let ch1 = String(situations[currentSituation].choice1.keys.first!)
        let ch2 = String(situations[currentSituation].choice2.keys.first!)
        
        return (ch1, ch2)
    }
    
    func getCurrentSituationText() -> String {
        return situations[currentSituation].text
    }
}
