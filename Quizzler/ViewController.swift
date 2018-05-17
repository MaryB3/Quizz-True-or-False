//
//  ViewController.swift
//  Quizzler
//
//  Created by  Maria Eugênia Teixeira on 16/05/18.
//  Copyright © 2017 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 { pickedAnswer = true }
        else if sender.tag == 2 { pickedAnswer = false }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber)
      
    }
    

    func nextQuestion() {
        
        if questionNumber < allQuestions.list.count {
            questionLabel.text = "\(allQuestions.list[questionNumber].questionText)"
            updateUI()
        }
        else {
            
            let deadlineTime = DispatchTime.now() + .seconds(1)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            
                let alert = UIAlertController(title: "Awesome!", message: "You've finished your questions all the questions. Do you want to start over?", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Yes", style: .default) { ( UIAlertAction ) in
                    self.startOver()
                }
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let firstQuestion = allQuestions.list[questionNumber].answer
       
        if pickedAnswer == firstQuestion {
            score = score + 1
            
            ProgressHUD.showSuccess("Correct")
            
        } else {
            
            ProgressHUD.showError("Wrong!")
            
        }
        
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}
