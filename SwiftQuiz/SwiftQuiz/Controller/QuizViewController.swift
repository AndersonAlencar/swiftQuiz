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

    var currentQuestion: QuizQuestion? {
        didSet {
            quizView.currentQuestion = currentQuestion
        }
    }

    lazy var quizView: QuizView = {
        let quizView = QuizView()
        quizView.delegate = self
        quizView.optionsQuizView.delegate = self
        quizView.timerView.delegate = self
        return quizView
    }()

    // MARK: Scope Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = quizView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        QuizManager.shared.resetData()
        reloadQuestion()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        quizView.timerView.animate(timer: 60)
    }

    func reloadQuestion() {
        self.currentQuestion = QuizManager.shared.newQuestion()
    }
}

extension QuizViewController: TimerQuizViewDelegate {
    func presentNextController() {
        let resultController = ResultViewController()
        resultController.modalPresentationStyle = .fullScreen
        present(resultController, animated: true, completion: nil)
    }
}

extension QuizViewController: OptionsViewDelegate {
    func didAnswerQuestion(with option: String) {
        // Verifica se resposta foi a correta
        guard let question = currentQuestion else { return }
        let success = question.validateOption(answer: option)
        QuizManager.shared.responseSuccess(success: success)
        // Carregar próxima pergunta
        reloadQuestion()

    }
}

extension QuizViewController: QuizViewDelegate {
    func presentResultViewController() {
        let resultController = ResultViewController()
        resultController.modalPresentationStyle = .fullScreen
        present(resultController, animated: true, completion: nil)
    }
}
