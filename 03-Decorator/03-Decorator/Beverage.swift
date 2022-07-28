//
//  Beverage.swift
//  03-Decorator
//
//  Created by Noah.Gao on 2022/7/28.
//

import Foundation

/// 饮料系统（超类）
class Beverage {
    func cost() -> Double { return 0.0 }
}

class DarkRoast: Beverage {
    override func cost() -> Double { return  20.0 }
}

/// 调料装饰类
class CondimentDecorator: Beverage {
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
}

class Mocha: CondimentDecorator {
    override func cost() -> Double {
        return 1.0 + self.beverage.cost()
    }
}

class Whip: CondimentDecorator {
    override func cost() -> Double {
        return 2.0 + self.beverage.cost()
    }
}

