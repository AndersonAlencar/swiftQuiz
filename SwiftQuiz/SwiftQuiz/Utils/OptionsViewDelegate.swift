//
//  OptionsViewDelegate.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 12/02/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation

protocol OptionsViewDelegate: class {
    func didAnswerQuestion(with option: String)
}
