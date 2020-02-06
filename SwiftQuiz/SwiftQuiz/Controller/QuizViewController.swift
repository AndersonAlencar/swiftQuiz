//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    let quizManager = QuizManager()

    lazy var quizView: QuizView = {
        let quizView = QuizView()
        quizView.timerView.delegate = self
        for button in quizView.optionsQuiz.optionsButtons {
            button.addTarget(self, action: #selector(getNewQuestion), for: .touchUpInside)
        }
        return quizView
    }()

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

    @objc func getNewQuestion() {
        let existingQuestion = quizManager.refreshQuiz()
        if !existingQuestion {
            quizView.questionLabel.text = quizManager.question
            for index in 0..<quizView.optionsQuiz.optionsButtons.count {
                quizView.optionsQuiz.optionsButtons[index].setTitle(quizManager.options[index], for: .normal)
            }
        } else {
            presentNextController()
        }
    }

}

extension QuizViewController: TimerQuizViewDelegate {
    func presentNextController() {
        let resultController = ResultViewController()
        resultController.modalPresentationStyle = .fullScreen
        present(resultController, animated: true, completion: nil)
    }
}
