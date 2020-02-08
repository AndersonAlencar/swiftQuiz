//
//  OptionsView.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 31/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class OptionsView: UIView {

    // MARK: Instance Variables

    lazy var optionsButtons: [UIButton] = {
       let optionsButtons = [UIButton]()
        return optionsButtons
    }()

    // MARK: Builders

    init(frame: CGRect, numbersOfOptions: Int) {
        super.init(frame: frame)
        for _ in 0..<numbersOfOptions {
            let button = UIButton()
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.numberOfLines = 0
            button.layer.cornerRadius = 20
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.contentHorizontalAlignment = .center
            button.backgroundColor = Color.mainColor
            button.translatesAutoresizingMaskIntoConstraints = false
            optionsButtons.append(button)
        }
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

}

// MARK: Extensions

extension OptionsView: ViewCode {
    func buildHierarchy() {
        for button in optionsButtons {
            addSubview(button)
        }
    }

    func setUpConstraints() {
        for (index, button) in optionsButtons.enumerated() {

            switch index {
                case 0:
                    NSLayoutConstraint.activate([
                        button.topAnchor.constraint(equalTo: topAnchor, constant: 1),
                        button.leadingAnchor.constraint(equalTo: leadingAnchor),
                        button.trailingAnchor.constraint(equalTo: trailingAnchor),
                        button.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
                    ])
                default:
                    NSLayoutConstraint.activate([
                        button.topAnchor.constraint(equalTo: optionsButtons[index-1].bottomAnchor, constant: 1),
                        button.leadingAnchor.constraint(equalTo: leadingAnchor),
                        button.trailingAnchor.constraint(equalTo: trailingAnchor),
                        button.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
                    ])
            }
        }
    }

    func additionalConfigurations() {
        backgroundColor = .white
    }
}
