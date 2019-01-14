//
//  GameViewController.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/13/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Label: UIButton!
    @IBOutlet weak var answer2Label: UIButton!
    @IBOutlet weak var answer3Label: UIButton!
    @IBOutlet weak var answer4Label: UIButton!
    @IBOutlet weak var rightWrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    // MARK: - Properties
    
    var firstNumber = 0
    var secondNumber = 0
    var correctAnswer = 0
    var answer1 = 0
    var answer2 = 0
    var answer3 = 0
    var answer4 = 0
    var answerArray: [Int] = []
    var totalCorrect = 0
    var totalAnswered = 0
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "0 / 0"
        updateQuestion()
        updateAnswers()
        
        answerArray = [answer1, answer2, answer3, answer4]
    }
    
    
    
    // MARK: - Methods
    
    func check(_ selectedAnswer: Int) {
        let isCorrect = correctAnswer == selectedAnswer
        updateScore(isCorrect: isCorrect)
    }
    
    
    func updateScore(isCorrect: Bool) {
        if isCorrect {
            totalCorrect += 1
        }
        
        totalAnswered += 1
        
        let darkGreen = UIColor(red:0.00, green:0.39, blue:0.00, alpha:1.0)
        let rightWrongText = isCorrect ? "Right!" : "Wrong!"
        let rightWrongColor: UIColor = isCorrect ? darkGreen : .red
        
        rightWrongLabel.text = rightWrongText
        rightWrongLabel.textColor = rightWrongColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.rightWrongLabel.text = ""
        }
        
        scoreLabel.text = "\(totalCorrect) / \(totalAnswered)"
    }
    
    
    func updateQuestion() {
        firstNumber = Int.random(in: 1...10)
        secondNumber = Int.random(in: 1...10)
        correctAnswer = firstNumber + secondNumber
        questionLabel.text = "What is \(firstNumber) + \(secondNumber)?"
    }
    
    
    func updateAnswers() {
        var answers = [correctAnswer]
        var randomAnswer = 0
        
        while answers.count < 4 {
            repeat {
                randomAnswer = Int.random(in: (correctAnswer - 5)...(correctAnswer + 5))
            } while answers.contains(randomAnswer)
            
            answers.append(randomAnswer)
        }
        
        answers.shuffle()
        
        answer1 = answers[0]
        answer2 = answers[1]
        answer3 = answers[2]
        answer4 = answers[3]
        
        answerArray = answers
        
        answer1Label.setTitle(String(answer1), for: .normal)
        answer2Label.setTitle(String(answer2), for: .normal)
        answer3Label.setTitle(String(answer3), for: .normal)
        answer4Label.setTitle(String(answer4), for: .normal)
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func quit(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    @IBAction func tapAnswer(_ sender: UIButton) {
        let selectedAnswer = answerArray[sender.tag]
        
        check(selectedAnswer)
        updateQuestion()
        updateAnswers()
    }
}
