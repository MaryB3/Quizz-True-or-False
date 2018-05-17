//
//  Question.swift
//  Quizzler
//
//  Created by Maria Eugênia Teixeira on 16/05/18.
//  Copyright © 2017 Maria Eugênia Teixeira. All rights reserved.
//

import Foundation


class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        
        questionText = text
        answer = correctAnswer
    }
    
}


