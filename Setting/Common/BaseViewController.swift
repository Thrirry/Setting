//
//  BaseViewController.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addLeftBarButtonWithImage(leftButton: UIBarButtonItem) {
        navigationItem.leftBarButtonItem = leftButton
        leftButton.tintColor = UIColor.navigatorItem.buttonColor
    }

}
