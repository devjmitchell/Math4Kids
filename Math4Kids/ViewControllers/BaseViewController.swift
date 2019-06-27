//
//  BaseViewController.swift
//  Math4Kids
//
//  Created by Jason Mitchell on 1/26/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

// TODO: Put StartScreenVC and GameVC into navigation stack / embed in navigation controller?
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(topColor: .purple, bottomColor: .orange)
//        navigationController?.isNavigationBarHidden = true
    }
}
