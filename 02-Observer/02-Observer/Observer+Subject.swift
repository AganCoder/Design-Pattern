//
//  Observer.swift
//  02-Observer
//
//  Created by Noah.Gao on 2022/7/22.
//

import Foundation

protocol Observer: AnyObject {
    func update(s: Subject)
}

protocol Subject {
    func registerObserver(o: Observer)
    func removeObserver(o: Observer)
    func notifyObserver()
}

class WeatherData: Subject  {
    
    private var observers: [Observer] = []
    
    func registerObserver(o: Observer) {
        self.observers.append(o)
    }
    
    func removeObserver(o: Observer) {
        if let index = self.observers.firstIndex(where: { $0 === o }) {
            self.observers.remove(at: index)
        }
    }
    
    func notifyObserver() {
        self.observers.forEach { $0.update(s: self) }
    }
    
    public private(set) var temperature: Double = 0.0
    public private(set) var humidity: Double = 0.0
    public private(set) var pressure: Double = 0.0
    
    func measureMentsChanged() {
        notifyObserver()
    }
    
    func setMeasureChanged(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        
        measureMentsChanged()
    }
}

class ConcreteObserverA: Observer {
    func update(s: Subject) {
        if let weather = s as? WeatherData {
            print(weather.humidity, weather.temperature)
        }
    }
}
