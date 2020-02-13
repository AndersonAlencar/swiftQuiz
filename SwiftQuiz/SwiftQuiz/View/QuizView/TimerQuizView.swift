//
//  TimerQuizView.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class TimerQuizView: UIView {

    // MARK: Instance Variables

    weak var delegate: TimerQuizViewDelegate?

    lazy var acessoryView: UIView = {
        let acessoryView = UIView()
        acessoryView.backgroundColor = Color.mainColor
        acessoryView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryView
    }()

    lazy var timerView: UIView = {
        let timerView = UIView()
        timerView.backgroundColor = Color.mainColor
        timerView.translatesAutoresizingMaskIntoConstraints = false
        return timerView
    }()

    lazy var acessoryLabel: UILabel = {
        let acessoryLabel = UILabel()
        acessoryLabel.textColor = .white
        acessoryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        acessoryLabel.translatesAutoresizingMaskIntoConstraints = false
        return acessoryLabel
    }()

    // MARK: Builders

    init(frame: CGRect, description: String) {
        super.init(frame: frame)
        acessoryLabel.text = description
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    // MARK: Class Functions

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func animate(timer: Double) {
        self.timerView.frame.size.width = self.frame.size.width
        acessoryView.backgroundColor = Color.acessoryColor
        UIView.animate(withDuration: timer, delay: 0, options: .curveLinear, animations: {
            self.timerView.frame.size.width = 0
        }, completion: { (_) in
            self.delegate?.presentNextController()
            self.acessoryView.backgroundColor = Color.mainColor
        })
    }
}

// MARK: Extensions

extension TimerQuizView: ViewCode {
    func buildHierarchy() {
        addSubview(acessoryView)
        addSubview(timerView)
        addSubview(acessoryLabel)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            acessoryView.topAnchor.constraint(equalTo: topAnchor),
            acessoryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            acessoryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            acessoryView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: topAnchor),
            timerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            timerView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            acessoryLabel.centerXAnchor.constraint(equalTo: acessoryView.centerXAnchor),
            acessoryLabel.centerYAnchor.constraint(equalTo: acessoryView.centerYAnchor)
        ])
    }

    func additionalConfigurations() {
        backgroundColor = .white
    }
}
