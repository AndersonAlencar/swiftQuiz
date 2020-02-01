//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 01/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    lazy var showResultsView: ResultView = {
        let showResultsView = ResultView()
        showResultsView.restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        return showResultsView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = showResultsView
    }

    @objc func restartGame() {
        dismiss(animated: true, completion: nil)
    }
}
