//
//  StartScreenViewController.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/13/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class StartScreenViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    func setupUI() {
        titleLabel.font = UIFont(name: FontNames.chalkduster, size: 80.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
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
        
        present(gameVC, animated: true)
    }
}
