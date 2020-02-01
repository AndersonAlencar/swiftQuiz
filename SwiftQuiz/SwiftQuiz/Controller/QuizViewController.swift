//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    lazy var quizView: QuizView = {
        let quizView = QuizView()
        quizView.timerView.delegate = self
        return quizView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = quizView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        quizView.timerView.animate(timer: 60.0)
    }

}

extension QuizViewController: TimerQuizViewDelegate {
    func presentNextController() {
        let resultController = ResultViewController()
        resultController.modalPresentationStyle = .fullScreen
        present(resultController, animated: true, completion: nil)
    }
}
