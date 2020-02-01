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
