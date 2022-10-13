//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {

    // MARK: Instance Variables

    lazy var showResultsView: ResultView = {
        let showResultsView = ResultView()
        showResultsView.restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        return showResultsView
    }()

    lazy var quizManager: QuizManager = {
        return QuizManager.shared
    }()

    // MARK: Escope Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        showResultsView.showAnswers()
    }

    override func loadView() {
        view = showResultsView
    }

    // MARK: Class Functions

    @objc func restartGame() {
        dismiss(animated: true, completion: nil)
    }
}
