//
//  ResultView.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 31/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ResultView: UIView {

    // MARK: Instance Variables

    lazy var quizManager: QuizManager = {
        return QuizManager.shared
    }()

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Resultado"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var answeredQuestionsLabel: UILabel = {
        let answeredQuestionsLabel = UILabel()
        answeredQuestionsLabel.textAlignment = .center
        answeredQuestionsLabel.text = "Texto de texte 123"
        answeredQuestionsLabel.font = UIFont.systemFont(ofSize: 25)
        answeredQuestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        return answeredQuestionsLabel
    }()

    lazy var correctQuestionsLabel: UILabel = {
        let correctQuestionsLabel = UILabel()
        correctQuestionsLabel.textAlignment = .center
        correctQuestionsLabel.textColor = Color.greenColor
        correctQuestionsLabel.text = "Texto de texte 123"
        correctQuestionsLabel.font = UIFont.systemFont(ofSize: 25)
        correctQuestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        return correctQuestionsLabel
    }()

    lazy var wrongQuestionsLabel: UILabel = {
        let wrongQuestionsLabel = UILabel()
        wrongQuestionsLabel.textAlignment = .center
        wrongQuestionsLabel.textColor = Color.redColor
        wrongQuestionsLabel.text = "Texto de texte 123"
        wrongQuestionsLabel.font = UIFont.systemFont(ofSize: 25)
        wrongQuestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        return wrongQuestionsLabel
    }()

    lazy var scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = "100%"
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 90)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()

    lazy var restartButton: UIButton = {
        let restartButton = UIButton()
        restartButton.backgroundColor = Color.mainColor
        restartButton.layer.cornerRadius = 5
        restartButton.setTitle("Reiniciar", for: .normal)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        return restartButton
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

    // MARK: View Functions

    func showAnswers() {
        answeredQuestionsLabel.text = "Perguntas respondidas: \(quizManager.totalAnswers)"
        correctQuestionsLabel.text = "Perguntas corretas: \(quizManager.correctedAnswers)"
        wrongQuestionsLabel.text = "Perguntas Erradas: \(quizManager.totalAnswers - quizManager.correctedAnswers)"
        scoreLabel.text = quizManager.totalAnswers == 0 ? "0%" : "\((quizManager.correctedAnswers)*100/quizManager.totalAnswers)%"
    }
}

// MARK: Extensions

extension ResultView: ViewCode {
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(answeredQuestionsLabel)
        addSubview(correctQuestionsLabel)
        addSubview(wrongQuestionsLabel)
        addSubview(scoreLabel)
        addSubview(restartButton)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            answeredQuestionsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            answeredQuestionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            answeredQuestionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            correctQuestionsLabel.topAnchor.constraint(equalTo: answeredQuestionsLabel.bottomAnchor, constant: 10),
            correctQuestionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            correctQuestionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            wrongQuestionsLabel.topAnchor.constraint(equalTo: correctQuestionsLabel.bottomAnchor, constant: 10),
            wrongQuestionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            wrongQuestionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: wrongQuestionsLabel.bottomAnchor, constant: 120),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            restartButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 110),
            restartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            restartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            restartButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
    }

    func additionalConfigurations() {
        backgroundColor = .white
    }
}
