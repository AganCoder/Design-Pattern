//
//  Template.swift
//  08-Template
//
//  Created by Noah.Gao on 2022/8/22.
//

import Foundation

public class Coffee {
    public func prepareRecipe() {
        boilWater()
        brewCoffeeGrinds()
        pourInCup()
        addSugarAndMilk()
    }
    
    func boilWater() {
        debugPrint(#function)
    }
    
    func brewCoffeeGrinds() {
        debugPrint(#function)
    }
    
    func pourInCup() {
        debugPrint(#function)
    }
    
    func addSugarAndMilk() {
        debugPrint(#function)
    }
}

public class Tea {
    public func prepareRecipe() {
        boilWater()
        steepTeaBag()
        addLemon()
        pourInCup()
    }
    
    func boilWater() {
        debugPrint(#function)
    }
    
    func steepTeaBag() {
        debugPrint(#function)
    }
    
    func addLemon() {
        debugPrint(#function)
    }
    
    func pourInCup() {
        debugPrint(#function)
    }
}
