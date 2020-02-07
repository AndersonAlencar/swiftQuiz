//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: Instance Variables

    let quizManager = QuizManager.shared
    var currentQuestion: QuizQuestion?
    lazy var quizView: QuizView = {
        let quizView = QuizView()
        quizView.timerView.delegate = self
        return quizView
    }()

    // MARK: Scope Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view = quizView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNewQuestion()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        quizView.timerView.animate(timer: 60.0)
    }

    // MARK: Class functions

    func getNewQuestion() {
        currentQuestion = quizManager.newQuestion()
        if let existingQuestion = currentQuestion {
            quizView.questionLabel.text = existingQuestion.question
            for index in 0..<quizView.answersQuizView.optionsButtons.count {
                quizView.answersQuizView.optionsButtons[index].setTitle(existingQuestion.options[index], for: .normal)
                quizView.answersQuizView.optionsButtons[index].addTarget(self, action: #selector(answerSelected(_:)), for: .touchUpInside)
            }
        } else {
            presentNextController()
        }
    }

    @objc func answerSelected(_ sender: UIButton) {
        let success = (currentQuestion?.validateOption(answer: sender.titleLabel!.text!))!
        quizManager.responseSuccess(success: success)
        getNewQuestion()
    }
}

extension QuizViewController: TimerQuizViewDelegate {
    func presentNextController() {
        let resultController = ResultViewController()
        resultController.modalPresentationStyle = .fullScreen
        present(resultController, animated: true, completion: nil)
    }
}
