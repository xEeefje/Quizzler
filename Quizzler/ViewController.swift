//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //eerste vraag wordt opgehaald en weergegeven
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        //kijkt op welke button is geklikt en voert checkAnswer uit
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        //questionNumber wordt met 1 verhoogd en de vraag wordt geupdate
        questionNumber = questionNumber + 1
        nextQuestion()
    }
    
    func updateUI() {
        //scoreLabel is gelijk aan de score
        scoreLabel.text = "Score: \(score)"
        
        //text van progesslabel is gelijk aan questionNumber + 1 (start bij 0)
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        //progressBar frame width is gelijk aan screen width / 13 (13 vragen) * CGFloat (int omzetten naar float) questionNumber + 1 (start bij 0)
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        //checkt wat de state is van questionNumber
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        }
        else {
            //maakt een pop-up aan het eind van de array
            let alert = UIAlertController(title: "Goed gedaan!", message: "Je hebt alle vragen beantwoord, wil je opnieuw beginnen?", preferredStyle: .alert)
            
            //Restart button zorgt ervoor dat je opnieuw begint
            let restartAction = UIAlertAction(title: "Begin opnieuw", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer() {
        //coorectAnswer wordt gelijk gezet aan de questenAnswer
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        //checkt of correctAnwers hetzelfde is als pickedAnswer, telt score bij en geeft feedback
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Goed")
            score = score + 1
        }
        else {
            ProgressHUD.showError("Fout")
        }
    }
    
    func startOver() {
        //reset questionNumber en score en zorgt voor de volgende vraag (1)
        questionNumber = 0
        score = 0
        nextQuestion()
    }

}
