//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Instance Variables

    lazy var showResultsView: ResultView = {
        let showResultsView = ResultView()
        showResultsView.restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        return showResultsView
    }()
    lazy var quizmanager: QuizManager = {
        return QuizManager.shared
    }()

    // MARK: Escope Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        view = showResultsView
        showResultsView.answeredQuestionsLabel.text = "Perguntas respondidas: \(quizmanager.totalAnswers)"
        showResultsView.correctQuestionsLabel.text = "Perguntas corretas: \(quizmanager.correctedAnswers)"
        showResultsView.wrongQuestionsLabel.text = "Perguntas Erradas: \(quizmanager.totalAnswers - quizmanager.correctedAnswers)"
        showResultsView.scoreLabel.text = quizmanager.totalAnswers == 0 ? "0%" : "\((quizmanager.correctedAnswers)*100/quizmanager.totalAnswers)%"

    }

    // MARK: Class Functions

    @objc func restartGame() {
        dismiss(animated: true, completion: nil)
    }
}
