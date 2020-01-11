//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Souza on 28/05/19.
//  Copyright © 2019 Anderson Souza. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viSecond: UIView!
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = self.view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
            self.viSecond.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        getNewQuiz()

    }

    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorretedAnswers
    }
    
    func  getNewQuiz() {
        let noQuestion = quizManager.refreshQuiz()
        if !noQuestion{
            lbQuestion.text = quizManager.question
            for i in 0..<quizManager.options.count{
                btAnswers[i].setTitle(quizManager.options[i], for: .normal)
            }
        } else {
            showResults()
        }
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        quizManager.validateAnswer(index: btAnswers.firstIndex(of: sender)!)
        getNewQuiz()
    }
    
    
}
