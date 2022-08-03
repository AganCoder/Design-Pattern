//
//  ViewController.swift
//  06-Command
//
//  Created by Noah.Gao on 2022/8/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customer = Customer()
        customer.createOrder()
    }


}

