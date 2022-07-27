//
//  ViewController.swift
//  02-Observer
//
//  Created by Noah.Gao on 2022/7/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherData()
        weather.registerObserver(o: ConcreteObserverA())
        
        weather.setMeasureChanged(temperature: 10.0, humidity: 20.0, pressure: 30.0)
    }
}

