//
//  GameViewController.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/13/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

enum GameMode: CaseIterable {
    case addition
    case subtraction
    case multiplication
    case division
    
    var operatorString: String {
        switch self {
        case .addition: return "+" // ➕
        case .subtraction: return "-" // ➖
        case .multiplication: return "x" // ✖️
        case .division: return "÷" // ➗
        }
    }
}
class GameViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var rightWrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    // MARK: - Properties
    
    var gameMode: GameMode = .addition
    
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
        
        configureUI()
        
        scoreLabel.text = "0 / 0"
        updateQuestion()
        updateAnswers()
        
        answerArray = [answer1, answer2, answer3, answer4]
    }
    
    
    
    // MARK: - Setup
    
    func configureUI() {
        quitButton.titleLabel?.font = UIFont(name: FontNames.chalkduster, size: 15.0)
        quitButton.tintColor = Colors.red
        
        questionLabel.font = UIFont(name: FontNames.chalkduster, size: 30.0)
        questionLabel.textColor = Colors.aqua
        
        answer1Button.configureAppearance(withSize: 20.0)
        answer2Button.configureAppearance(withSize: 20.0)
        answer3Button.configureAppearance(withSize: 20.0)
        answer4Button.configureAppearance(withSize: 20.0)
        
        rightWrongLabel.font = UIFont(name: FontNames.chalkduster, size: 30.0)
        
        scoreLabel.font = UIFont(name: FontNames.chalkduster, size: 17.0)
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
        
        switch gameMode {
        case .addition:
            correctAnswer = firstNumber + secondNumber
            
        case .subtraction:
            if firstNumber < secondNumber {
                swap(&firstNumber, &secondNumber)
            }
            correctAnswer = firstNumber - secondNumber
            
        case .multiplication:
            correctAnswer = firstNumber * secondNumber
            
        case .division:
            firstNumber *= secondNumber
            correctAnswer = firstNumber / secondNumber
        }
        
        questionLabel.text = """
        What is...
        
        \(firstNumber) \(gameMode.operatorString) \(secondNumber)
        """
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
        
        answer1Button.setTitle(String(answer1), for: .normal)
        answer2Button.setTitle(String(answer2), for: .normal)
        answer3Button.setTitle(String(answer3), for: .normal)
        answer4Button.setTitle(String(answer4), for: .normal)
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
