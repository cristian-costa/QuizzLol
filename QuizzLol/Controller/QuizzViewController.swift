//
//  ViewController.swift
//  QuizzLol
//
//  Created by Cristian Costa on 09/08/2021.
//

import UIKit

class QuizzViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizzBrain = QuizzBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizzBrain.checkAnswer(answer: sender.currentTitle!) { //true or false
            print(quizzBrain.questionNumber)
            print("VERDADERA")
            sender.backgroundColor = .green
        } else {
            print(quizzBrain.questionNumber)
            print("FALSA")
            sender.backgroundColor = .red
        }
                
        if quizzBrain.questions.count < quizzBrain.numberOfQuestions - 1 {
            quizzBrain.randomQuestion()
        } else {
            performSegue(withIdentifier: "goToResult", sender: self)
            quizzBrain.reset()
        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        firstButton.setTitle(quizzBrain.setButton(0), for: .normal)
        secondButton.setTitle(quizzBrain.setButton(1), for: .normal)
        thirdButton.setTitle(quizzBrain.setButton(2), for: .normal)
        questionLabel.text = quizzBrain.getQuestionText()
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
        thirdButton.backgroundColor = .clear
        progressBar.progress = quizzBrain.getProgress()
        scoreLabel.text = quizzBrain.getScore()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ScoreViewController
            destinationVC.score = quizzBrain.correctAnswer
            destinationVC.totalQuestions = quizzBrain.numberOfQuestions
        }
    }
}

