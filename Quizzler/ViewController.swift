//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestinBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) of 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        print(progressBar.frame.size)
    }

    
    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            updateUI()
        }
        else {
            
            print("Koniec konkursu")
            
            let alert = UIAlertController(title: "Super", message: "Wszystkie pytania przerobione. Jeszcze raz?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            print("Bardzo dobrze!")
            score = score + 1
        }
        else {
            print("Źle!!!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
    
    
}
