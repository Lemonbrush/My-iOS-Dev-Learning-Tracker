//
//  Story.swift
//  Destiny
//
//  Created by Александр on 21.02.2021.
//

import Foundation

struct Story {
    let text: String
    let choice1: [String: Int?]
    let choice2: [String: Int?]
    
    init(_ text: String, c1: String, leadsTo destiny1: Int?, c2: String, leadsTo destiny2: Int?) {
        self.text = text
        choice1 = [c1: destiny1]
        choice2 = [c2: destiny2]
    }
}
