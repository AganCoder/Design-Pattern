//
//  ViewController.swift
//  08-Template
//
//  Created by Noah.Gao on 2022/8/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coffee = Coffee()
        coffee.prepareRecipe()
        
        let tea = Tea()
        tea.prepareRecipe()
    }
}

