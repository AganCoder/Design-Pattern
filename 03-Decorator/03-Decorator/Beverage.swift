//
//  Beverage.swift
//  03-Decorator
//
//  Created by Noah.Gao on 2022/7/28.
//

import Foundation

/// 饮料系统（超类）
protocol Beverage {
    func cost() -> Double
}

class DarkRoast: Beverage {
    func cost() -> Double { return  20.0 }
}

protocol CondimentDecorator: Beverage {}

class Mocha: CondimentDecorator {
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Double {
        return 1.0 + self.beverage.cost()
    }
}

class Whip: CondimentDecorator {
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Double {
        return 2.0 + self.beverage.cost()
    }
}

