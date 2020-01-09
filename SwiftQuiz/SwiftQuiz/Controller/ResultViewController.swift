//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Anderson Souza on 28/05/19.
//  Copyright © 2019 Anderson Souza. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    
    @IBOutlet weak var lbAnswred: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lbAnswred.text = "Perguntas Respondidas: \(self.totalAnswers)"
        self.lbCorrect.text = "Perguntas Corretas: \(self.totalCorrectAnswers)"
        self.lbWrong.text = "Perguntas Erradas: \(self.totalAnswers - self.totalCorrectAnswers)"
        
        self.lbScore.text = "\(self.totalCorrectAnswers*100/self.totalAnswers)"
    }
    

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
