//
//  ViewController.swift
//  03-Decorator
//
//  Created by Noah.Gao on 2022/7/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var beverage: Beverage = DarkRoast()
        beverage = Mocha(beverage: beverage)
        beverage = Whip(beverage: beverage)
        
        print(beverage.cost())
    }


}

