//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

class QuizManager {

    // MARK: Instance Variables

    lazy var quizes: [QuizQuestion] = {
        return loadQuizes(data: "questions")
    }()

    private lazy var listIndex: Set<Int> =  {
        return createListQuestions()
    }()

    var totalAnswers  = 0
    var correctedAnswers = 0
    static let shared = QuizManager()
    private init() {}

    // MARK: Class Functions

    func newQuestion() -> QuizQuestion? {
        if listIndex.isEmpty {
            listIndex = createListQuestions()
            return nil
        } else {
            let quizData = quizes[listIndex.first!]
            listIndex.removeFirst()
            return quizData
        }
    }

    func resetData() {
        listIndex = createListQuestions()
        totalAnswers = 0
        correctedAnswers = 0
    }

    func createListQuestions() -> Set<Int> {
        var array = Set<Int>()
        for index in 0..<quizes.count {
            array.insert(index)
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

    func responseSuccess(success: Bool) {
        if success {
            totalAnswers += 1
            correctedAnswers += 1
        } else {
            totalAnswers += 1
        }
    }
}
