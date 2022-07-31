//
//  ViewController.swift
//  04-Factory
//
//  Created by Noah.Gao on 2022/7/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        PizzaStore(pizzaFactory: SimplePizzaFactory()).orderPizza(type: "cheese")
        
        PizzaStore(pizzaFactory: NYPizzaFactory()).orderPizza(type: "cheese")
        PizzaStore(pizzaFactory: ChicagoPizzaFactory()).orderPizza(type: "cheese")
        
    }


}

