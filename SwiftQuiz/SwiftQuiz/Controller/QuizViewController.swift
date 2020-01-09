//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Souza on 28/05/19.
//  Copyright © 2019 Anderson Souza. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        getNewQuiz()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorretedAnswers
    }
    
    func showResults() -> Void {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    
    func  getNewQuiz() -> Void {
        quizManager.refreshQuiz()
        self.lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count{
            self.btAnswers[i].setTitle(quizManager.options[i], for: .normal)
        }
    }
    
    

    
    @IBAction func selectAnswer(_ sender: UIButton) {
        
        
        quizManager.validateAnswer(index: self.btAnswers.firstIndex(of: sender)!)
        getNewQuiz()
    }
    
    
}
