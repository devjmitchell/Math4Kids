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
        self.tintColor = Colors.white
        self.backgroundColor = Colors.aqua
        
        // This gives a rounded button
        layer.cornerRadius = frame.size.height / 2
    }
}
