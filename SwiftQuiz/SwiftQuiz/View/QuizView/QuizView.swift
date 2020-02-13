//
//  QuizView.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class QuizView: UIView {

    // MARK: Instance Variables

    weak var delegate: QuizViewDelegate?

    var currentQuestion: QuizQuestion? {
        willSet(newValue) {

            if let quizQuestion = newValue {
                //seta enunciado
                questionLabel.text = quizQuestion.question
                //seta opcoes de resposta
                optionsQuizView.options = quizQuestion.options
            } else {
                delegate?.presentResultViewController()
            }
        }
    }

    lazy var timerView: TimerQuizView = {
        let timerView = TimerQuizView(frame: CGRect.zero, description: "Tempo Restante")
        timerView.translatesAutoresizingMaskIntoConstraints = false
        return timerView
    }()

    lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.numberOfLines = 0
        questionLabel.text = "Label para testes"
        questionLabel.textAlignment = .center
        questionLabel.adjustsFontSizeToFitWidth = true
        questionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()

    lazy var optionsQuizView: OptionsView = {
        let optionsQuiz = OptionsView(frame: CGRect.zero, numbersOfOptions: 4)
        optionsQuiz.translatesAutoresizingMaskIntoConstraints = false
        return optionsQuiz
    }()

    // MARK: Builders

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
}

// MARK: Extensions

extension QuizView: ViewCode {
    func buildHierarchy() {
        addSubview(timerView)
        addSubview(questionLabel)
        addSubview(optionsQuizView)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            timerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            timerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])

        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            questionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])

        NSLayoutConstraint.activate([
            optionsQuizView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 15),
            optionsQuizView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionsQuizView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionsQuizView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
            //optionsQuiz.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }

    func additionalConfigurations() {
        backgroundColor = .white
    }
}
