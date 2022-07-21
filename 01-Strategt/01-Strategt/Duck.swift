//
//  Duck.swift
//  01-Strategt
//
//  Created by Noah.Gao on 2022/7/20.
//

import Foundation

//protocol DuckRepresentable {
//    func quack()
//    func swim()
//    func display()
//    func fly()
//}
//
//extension DuckRepresentable {
//    func quack() { debugPrint("嘎嘎") }
//    func swim() { debugPrint("游泳") }
//    func fly() { }
//}
//
//
//class MallarDuck: DuckRepresentable {
//    func display() { debugPrint( "Mallar Duck display" ) }
//    func fly() { debugPrint( "Mallar Duck Fly" ) }
//}
//
//class RedHeadDuck: DuckRepresentable {
//    func display() { debugPrint( "Red Head Duck display" ) }
//    func fly() { debugPrint( "Mallar Duck Fly" ) }
//}
//
//class RubberDuck: DuckRepresentable {
//    func display() { debugPrint( "Rubber Duck display" ) }
//    func fly() { debugPrint( "Rubber Duck Fly" ) }
//}


protocol FlyBehavior {
    func fly()
}

class FlyNoWay: FlyBehavior {
    func fly() { debugPrint( "无法飞行") }
}

class FlyWithWings: FlyBehavior {
    func fly() { debugPrint( "可飞行 ") }
}

protocol QuackBehavior {
    func quack()
}

class MuteQuack: QuackBehavior {
    func quack() { debugPrint( "无法叫" ) }
}

class Squeak: QuackBehavior {
    func quack() { debugPrint( "嘎嘎" ) }
}

class Creak: QuackBehavior {
    func quack() { debugPrint( "吱吱" ) }
}

class Duck {
    
    var flyBehavior: FlyBehavior?
    var quackBehavior: QuackBehavior?
    
    func swim() { debugPrint("游泳") }
    func display() { }
    
    func makeFly() { flyBehavior?.fly() }
    func makeQuack() { quackBehavior?.quack() }
}

class MallarDuck: Duck {
    
    override init() {
        super.init()
        
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = Squeak()
    }
    
    override func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: Duck {
    
    override init() {
        super.init()
        
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = Squeak()
    }
    
    override func display() { debugPrint( "Red Head Duck display" ) }
}

class RubberDuck: Duck {
    override init() {
        super.init()
        
        self.flyBehavior = FlyNoWay()
        self.quackBehavior = Creak()
    }
    
    func makeWing() {
        self.flyBehavior = FlyWithWings()
    }
    
    func makeBreaken() {
        self.quackBehavior = MuteQuack()
    }
    
    override func display() { debugPrint( "Rubber Duck display" ) }

}

