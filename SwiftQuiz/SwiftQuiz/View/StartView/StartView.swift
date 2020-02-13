//
//  StartView.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class StartView: UIView {

    // MARK: Instance Variables

    lazy var backgroundImage: UIImageView  = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "LaunchScreen")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()

    lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("Começar", for: UIControl.State.normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
    }()

    // MARK: Builders

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

// MARK: Extensions

extension StartView: ViewCode {
    func buildHierarchy() {
        addSubview(backgroundImage)
        addSubview(startButton)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }

    func additionalConfigurations() {
        backgroundColor = .white
    }
}
