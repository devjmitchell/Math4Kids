//
//  StartScreenViewController.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/13/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class StartScreenViewController: BaseViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var additionButton: UIButton!
    @IBOutlet var subtractionButton: UIButton!
    @IBOutlet var multiplicationButton: UIButton!
    @IBOutlet var divisionButton: UIButton!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var quizTypeControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    func setupUI() {
        titleLabel.font = UIFont(name: FontNames.chalkduster, size: 80.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
        
        quizTypeControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: FontNames.chalkduster, size: 17) as Any], for: .normal)
    }
    

    @IBAction func play(_ sender: UIButton) {
        let gameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        switch sender.tag {
        case 1:
            gameVC.gameMode = GameMode.addition
        case 2:
            gameVC.gameMode = GameMode.subtraction
        case 3:
            gameVC.gameMode = GameMode.multiplication
        case 4:
            gameVC.gameMode = GameMode.division
        default:
            gameVC.isRandomMode = true
            gameVC.gameMode = GameMode.allCases.randomElement()!
        }
        
        if quizTypeControl.selectedSegmentIndex == 0 {
            gameVC.quizType = .timed
        } else {
            gameVC.quizType = .questionCount
        }
        
        present(gameVC, animated: true)
    }
}
