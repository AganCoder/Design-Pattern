//
//  Adpater.swift
//  07-Adpater
//
//  Created by Noah.Gao on 2022/8/7.
//

import UIKit


protocol Duck {
    func swim()
    func quack()
    func walk()
}

class Bird {
    func walk() { debugPrint( "bird walk" ) }
    func tweet() { debugPrint( "bird tweet" ) }
    func bathe() { debugPrint( "bird bathe" ) }
}

class BirdAdapter: Duck {
    let bird: Bird
    
    init(bird: Bird) {
        self.bird = bird
    }
    
    func swim() {
        self.bird.bathe()
    }
    
    func quack() {
        self.bird.tweet()
    }
    
    func walk() {
        self.bird.walk()
    }
}
