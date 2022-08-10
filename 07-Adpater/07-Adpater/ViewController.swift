//
//  ViewController.swift
//  07-Adpater
//
//  Created by Noah.Gao on 2022/8/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let bird = Bird()
        let duck = BirdAdapter(bird: bird)
        
        duck.quack()
        duck.walk()
        duck.swim()
    }
}

