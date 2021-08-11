//
//  ScoreViewController.swift
//  QuizzLol
//
//  Created by Cristian Costa on 10/08/2021.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    var score: Int?
    var totalQuestions: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLabel.setTitle("Reintentar", for: .normal)
        if let safeScore = score {
            if let safeTotalQuestions = totalQuestions {
                scoreLabel.text = "Respondiste \(safeScore) preguntas correctas de \(safeTotalQuestions)"
            }
        }
    }
    
    @IBAction func retryPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
