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
    @IBOutlet weak var playLabel: UILabel!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var shuffleAllButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    func configureUI() {        
        titleLabel.font = UIFont(name: FontNames.chalkduster, size: 30.0)
        titleLabel.textColor = Colors.red
        
        playLabel.font = UIFont(name: FontNames.chalkduster, size: 20.0)
        playLabel.textColor = Colors.aqua
        
        additionButton.configureAppearance(withSize: 25.0)
        subtractionButton.configureAppearance(withSize: 25.0)
        multiplicationButton.configureAppearance(withSize: 25.0)
        divisionButton.configureAppearance(withSize: 25.0)
        shuffleAllButton.configureAppearance(withSize: 25.0)
        
        shuffleAllButton.backgroundColor = Colors.blue
    }
    

    @IBAction func play(_ sender: UIButton) {        
        let gameVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.gameModeTag = sender.tag
        present(gameVC, animated: true)
    }
}

