//
//  Furniture.swift
//  04-Factory
//
//  Created by Noah.Gao on 2022/8/1.
//

import Foundation

protocol Table {}
protocol Chair {}

class ChineseDiningTable: Table {}
class ChineseChair: Chair {}

class EuropeanDiningTable: Table {}
class EuropeanChair: Chair {}


protocol FurnitureFactory {
    func makeTable() -> Table
    func makeChair() -> Chair
}

class ChineseFurnitureFactory: FurnitureFactory {
    func makeTable() -> Table {
        return ChineseDiningTable()
    }
    
    func makeChair() -> Chair {
        return ChineseChair()
    }
}


class EuropeanFurnitureFactory: FurnitureFactory {
    func makeTable() -> Table {
        return EuropeanDiningTable()
    }
    
    func makeChair() -> Chair {
        return EuropeanChair()
    }
}


