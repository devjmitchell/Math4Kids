//
//  UIButton+.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/20/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureAppearance(withSize fontSize: CGFloat) {
        self.titleLabel?.font = UIFont(name: FontNames.chalkduster, size: fontSize)
//        self.titleLabel?.font = UIFont(name: FontNames.chalkduster, size: 80)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        
        self.tintColor = .white
        
        
        self.setGradientBackground(topColor: Colors.buttonGradientTop, bottomColor: Colors.buttonGradientBottom)
        
        // This gives a rounded button
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
