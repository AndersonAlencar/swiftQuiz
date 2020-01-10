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

        lbAnswred.text = "Perguntas Respondidas: \(totalAnswers)"
        lbCorrect.text = "Perguntas Corretas: \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas Erradas: \(totalAnswers - totalCorrectAnswers)"
        
        lbScore.text = totalAnswers == 0 ? "0%" : "\(totalCorrectAnswers*100/totalAnswers)%"
    }
    

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
