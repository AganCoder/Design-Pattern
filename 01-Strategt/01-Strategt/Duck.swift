//
//  Duck.swift
//  01-Strategt
//
//  Created by Noah.Gao on 2022/7/20.
//

import Foundation

class Duck {
    func quack() { debugPrint("嘎嘎") }
    
    func swim() { debugPrint("游泳") }
    
    func display() { fatalError(" subclass implement ") }
}

class MallarDuck: Duck {
    override func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: Duck {
    override func display() { debugPrint( "Red Head Duck display" ) }
}
