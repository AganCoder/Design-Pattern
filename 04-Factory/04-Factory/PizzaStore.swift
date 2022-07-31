//
//  PizzaStore.swift
//  04-Factory
//
//  Created by Noah.Gao on 2022/7/31.
//

import Foundation

/// 面团
protocol Dough {}

/// 酱汁
protocol Sauce {}

class NYDough: Dough { }
class NYSauce: Sauce { }

class ChicagoDough: Dough { }
class ChicagoSauce: Sauce { }

/// 原料工厂
protocol PizzaIngredientFactory {
    func makeDough() -> Dough
    func makeSauce() -> Sauce
}

class NYPizzaIngredientFactory: PizzaIngredientFactory {
    func makeDough() -> Dough {
        return NYDough()
    }
    
    func makeSauce() -> Sauce {
        return NYSauce()
    }
}

class ChicagoPizzaIngredientFactory: PizzaIngredientFactory {
    func makeDough() -> Dough {
        return ChicagoDough()
    }
    
    func makeSauce() -> Sauce {
        return ChicagoSauce()
    }
}


protocol Pizza {
    func prepare()
    func bake()
    func cut()
    func box()
}

protocol PizzaFactory {
    func createPizza(type: String) -> Pizza?
}

class SimplePizzaFactory: PizzaFactory {
    func createPizza(type: String) -> Pizza? {
        var pizza: Pizza? = nil
        
        if type == "cheese" {
            pizza = CheesePizza()
        } else if type == "Greek" {
            pizza = GreekPizza()
        }
        
        return pizza
    }
}

/// New York 披萨工厂方法，创建 New York 风味的 Pizza
class NYPizzaFactory: PizzaFactory {
    
    let pizzaIngredientFactory = NYPizzaIngredientFactory()
    
    func createPizza(type: String) -> Pizza? {
        var pizza: Pizza? = nil
        
        if type == "cheese" {
            pizza = NYCheesePizza(ingredientFactory: self.pizzaIngredientFactory)
        } else if type == "Greek" {
            pizza = NYGreekPizza(ingredientFactory: self.pizzaIngredientFactory)
        }
        
        return pizza
    }
}

/// Chicago 披萨工厂方法，创建 Chicago 风味的 Pizza
class ChicagoPizzaFactory: PizzaFactory {
    let pizzaIngredientFactory = ChicagoPizzaIngredientFactory()
    func createPizza(type: String) -> Pizza? {
        var pizza: Pizza? = nil
        
        if type == "cheese" {
            pizza = ChicagoCheesePizza(ingredientFactory: self.pizzaIngredientFactory)
        } else if type == "Greek" {
            pizza = ChicagoGreekPizza(ingredientFactory: self.pizzaIngredientFactory)
        }
        
        return pizza
    }
}

class PizzaStore {
    
    let pizzaFactory: PizzaFactory
    init(pizzaFactory: PizzaFactory) {
        self.pizzaFactory = pizzaFactory
    }
        
    func orderPizza(type: String) -> Pizza? {
        let pizza: Pizza? = self.pizzaFactory.createPizza(type: type)
        
        pizza?.prepare()
        pizza?.bake()
        pizza?.cut()
        pizza?.box()
        return pizza
    }
}

class CheesePizza: Pizza {
    func prepare() { debugPrint("Cheese Prepare") }
    func bake() { debugPrint("Cheese Bake") }
    func cut() { debugPrint("Cheese Cut") }
    func box() { debugPrint("Cheese Box") }
}

class GreekPizza: Pizza {
    func prepare() { debugPrint("Greek Prepare") }
    func bake() { debugPrint("Greek Bake") }
    func cut() { debugPrint("Greek Cut") }
    func box() { debugPrint("Greek Box") }
}


class NYCheesePizza: Pizza {
    
    let ingredientFactory: PizzaIngredientFactory
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        debugPrint(" NYCheese Prepare ")
        debugPrint("using douch: \(self.ingredientFactory.makeDough())" )
        debugPrint("using Sauch: \(self.ingredientFactory.makeSauce())" )
        
    }
    func bake() { debugPrint("NYCheese Bake") }
    func cut() { debugPrint("NYCheese Cut") }
    func box() { debugPrint("NYCheese Box") }
}

class NYGreekPizza: Pizza {
    let ingredientFactory: PizzaIngredientFactory
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        debugPrint(" NYGreek Prepare ")
        debugPrint("using douch: \(self.ingredientFactory.makeDough())" )
        debugPrint("using Sauch: \(self.ingredientFactory.makeSauce())" )
        
    }

    func bake() { debugPrint("NYGreek Bake") }
    func cut() { debugPrint("NYGreek Cut") }
    func box() { debugPrint("NYGreek Box") }
}

class ChicagoCheesePizza: Pizza {
    let ingredientFactory: PizzaIngredientFactory
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        debugPrint(" ChicagoCheese Prepare ")
        debugPrint("using douch: \(self.ingredientFactory.makeDough())" )
        debugPrint("using Sauch: \(self.ingredientFactory.makeSauce())" )
        
    }
    
    func bake() { debugPrint("ChicagoCheese Bake") }
    func cut() { debugPrint("ChicagoCheese Cut") }
    func box() { debugPrint("ChicagoCheese Box") }
}

class ChicagoGreekPizza: Pizza {
    let ingredientFactory: PizzaIngredientFactory
    init(ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
    }
    
    func prepare() {
        debugPrint(" ChicagoGreek Prepare ")
        debugPrint("using douch: \(self.ingredientFactory.makeDough())" )
        debugPrint("using Sauch: \(self.ingredientFactory.makeSauce())" )
        
    }
    func bake() { debugPrint("ChicagoGreek Bake") }
    func cut() { debugPrint("ChicagoGreek Cut") }
    func box() { debugPrint("ChicagoGreek Box") }
}



