//
//  CustomButton.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/20/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        
        backgroundColor = Colors.buttonGradientBottom
//        titleLabel?.font = UIFont(name: FontNames.chalkduster, size: fontSize)
        titleLabel?.font = UIFont(name: FontNames.chalkduster, size: 60)
        titleLabel?.adjustsFontSizeToFitWidth = true
        
        
//        setGradientBackground(topColor: Colors.buttonGradientTop, bottomColor: Colors.buttonGradientBottom)
        
        // This gives a rounded button
//        let shorterSideLength = frame.height < frame.width ? frame.height : frame.width
//        layer.cornerRadius = shorterSideLength / 2
//        let shorterSideLength = layer.frame.height < layer.frame.width ? layer.frame.height : layer.frame.width
        self.layer.cornerRadius = 50
//        self.clipsToBounds = true
        
//        self.setNeedsLayout()
//        self.setNeedsDisplay()
    }
}
