//
//  BaseViewController.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/26/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(topColor: Colors.backgroundGradientTop, bottomColor: Colors.backgroundGradientBottom)
    }
}
