//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation
class QuizQuestion: Codable {

    // MARK: Instance Variables

    let question: String
    let options: [String]
    let correctAnswer: String

    // MARK: Builders

    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctedAnswer
    }

    // MARK: Class Functions

    func validateOption(answer: String) -> Bool {
        return answer == correctAnswer
    }

    deinit {
        print("Liberou Quiz da memória")
    }
}
