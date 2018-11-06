//
//  Question.swift
//  Quizzler
//
//  Created by Jacek Krzyzanowski on 06/11/2018.
//  Copyright © 2018 krzyzakov. All rights reserved.
//

import Foundation

class Question {
    let questionText: String //a tutaj malutki komentarz
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}

let obj = Question(text: "Czy Kubuś jest mądry", correctAnswer: true)
