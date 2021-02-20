//
//  Question.swift
//  Quizzler
//
//  Created by Александр on 20.02.2021.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
