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
        
        let redHead = RedHeadDuck()
        redHead.quack()
        redHead.swim()
        redHead.display()
    }


}

