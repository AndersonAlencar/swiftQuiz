//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation
class QuizQuestion: Codable {

    let question: String
    let options: [String]
    let correctAnswer: String

    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctedAnswer
    }

    func validateOption(_ index: Int) -> Bool {
        let answwer = options[index]
        return answwer == correctAnswer
    }

    deinit {
        print("Liberou Quiz da memória")
    }
}
