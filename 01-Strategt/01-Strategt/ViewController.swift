//
//  ViewController.swift
//  01-Strategt
//
//  Created by Noah.Gao on 2022/7/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mallar = MallarDuck()
        mallar.quack()
        mallar.swim()
        mallar.display()
        mallar.fly()
        
        let redHead = RedHeadDuck()
        redHead.quack()
        redHead.swim()
        redHead.display()
        redHead.fly()
        
        
        let rubber = RubberDuck()
        rubber.quack()
        rubber.swim()
        rubber.display()
        rubber.fly()
        
    }
}

