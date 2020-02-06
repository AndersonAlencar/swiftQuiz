//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

class QuizManager {

    lazy var quizes: [QuizQuestion] = {
        return loadQuizes(data: "questions")
    }()

    private lazy var listIndex: Set<Int> =  {
        return createListQuestions()
    }()

    private var quiz: QuizQuestion!
    private var totalAnswers  = 0
    private var totalCorrectedAnswers = 0

    var question: String {
        return quiz.question
    }

    var options: [String] {
        return quiz.options
    }

    func refreshQuiz() -> Bool {
        if listIndex.isEmpty {
            listIndex = createListQuestions()
            return true
        } else {
            let quizData = quizes[listIndex.first!]
            listIndex.removeFirst()
            quiz = quizData
            return false
        }
    }

    func validateAnswer(index: Int) {
        totalAnswers += 1
        if self.quiz.validateOption(index) {
            totalCorrectedAnswers += 1
        }
    }

    func createListQuestions() -> Set<Int> {
        var array = Set<Int>()
        while array.count < quizes.count {
            let randomNumber = Int.random(in: 0..<quizes.count)
            array.insert(randomNumber)
        }
        return array
    }

    func loadQuizes(data: String) -> [QuizQuestion] {
        let fileUrl = Bundle.main.url(forResource: data, withExtension: "json")!
        let jsonData = try? Data(contentsOf: fileUrl)
        var quizQuestions = [QuizQuestion]()
        do {
            quizQuestions =  try JSONDecoder().decode([QuizQuestion].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }
        return quizQuestions
    }
}
