//
//  QuizView.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class QuizView: UIView {

    lazy var timerView: TimerQuizView = {
        let timerView = TimerQuizView(frame: CGRect.zero, description: "Tempo Restante")
        timerView.translatesAutoresizingMaskIntoConstraints = false
        return timerView
    }()

    lazy var questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "Label para testes"
        questionLabel.numberOfLines = 0
        questionLabel.adjustsFontSizeToFitWidth = true
        questionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()

    lazy var optionsQuiz: OptionsView = {
        let optionsQuiz = OptionsView(frame: CGRect.zero, numbersOfOptions: 4)
        optionsQuiz.translatesAutoresizingMaskIntoConstraints = false
        return optionsQuiz
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
}

extension QuizView: ViewCode {
    func buildHierarchy() {
        addSubview(timerView)
        addSubview(questionLabel)
        addSubview(optionsQuiz)
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
            optionsQuiz.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 15),
            optionsQuiz.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionsQuiz.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionsQuiz.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }

    func additionalConfigurations() {
        backgroundColor = .white
    }
}
