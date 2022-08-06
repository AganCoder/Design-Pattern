//
//  RemoteController.swift
//  06-Command
//
//  Created by Noah.Gao on 2022/8/3.
//

import Foundation

class OutdoorLight {
    func on() { debugPrint( "OutdoorLight on") }
    func off() { debugPrint( "OutdoorLight off") }
}

class CeilingLight {
    func on() { debugPrint( "CeilingLight on") }
    func off() { debugPrint( "CeilingLight off") }
    func dim() { debugPrint( "CeilingLight dim") }
}

class GardenLight {
    func setDuskTime() { debugPrint( "GardenLight setDuskTime") }
    func setDawnTime() { debugPrint( "GardenLight setDawnTime") }
    func manualOn() { debugPrint( "GardenLight manualOn") }
    func manualOff() { debugPrint( "GardenLight manualOff") }
}

class CeilingFan {
    func high() { debugPrint( "CeilingFan high") }
    func medium() { debugPrint( "CeilingFan medium") }
    func low() { debugPrint( "CeilingFan low") }
    func off() { debugPrint( "CeilingFan off") }
    func getSpeed() { debugPrint( "CeilingFan getSpeed") }
}

class Sprinkler {
    func waterOn() { debugPrint( "Sprinkler waterOn") }
    func waterOff() { debugPrint( "Sprinkler  waterOff") }
}

class Light {
    func on() { debugPrint( "Light on") }
    func off() { debugPrint( "Light off") }
}

protocol Command {
    func excute()
}

class LightOnCommand: Command {
    let light: Light
    
    init(light: Light) { self.light = light }
    
    func excute() { self.light.on()  }
}

class LightOffCommand: Command {
    let light: Light
    
    init(light: Light) { self.light = light }
    
    func excute() { self.light.off()  }
}

class NoCommand: Command {
    func excute() { }
}


class SimpleRemoteControl {
    
    var onCommands: [Command] = Array(repeating: NoCommand(), count: 7)
    var offCommands: [Command] = Array(repeating: NoCommand(), count: 7)
    
    func setCommand(slot: Int, onCommand: Command, offCommand: Command) {
        self.onCommands[slot] = onCommand
        self.offCommands[slot] = offCommand
    }
    
    func onButtonWasPressed(at slot: Int) {
        self.onCommands[slot].excute()
    }
    
    func offButtonWasPressed(at slot: Int) {
        self.offCommands[slot].excute()
    }
}
