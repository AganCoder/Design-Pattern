//
//  Duck.swift
//  01-Strategt
//
//  Created by Noah.Gao on 2022/7/20.
//

import Foundation

protocol DuckRepresentable {
    func quack()
    func swim()
    func display()
}

extension DuckRepresentable {
    func quack() { debugPrint("嘎嘎") }
    func swim() { debugPrint("游泳") }
}


class MallarDuck: DuckRepresentable {
    func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: DuckRepresentable {
    func display() { debugPrint( "Red Head Duck display" ) }
}
