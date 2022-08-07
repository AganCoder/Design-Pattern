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
    enum Speed {
        case off
        case high
        case medium
        case low
    }
    
    var speed: Speed = .off
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
    func undo()
}

class LightOnCommand: Command {
    let light: Light
    
    init(light: Light) { self.light = light }
    
    func excute() { self.light.on()  }
    
    func undo() { self.light.on() }
}

class LightOffCommand: Command {
    let light: Light
    
    init(light: Light) { self.light = light }
    
    func excute() { self.light.off()  }
    
    func undo() { self.light.on() }
}

class CeilingFanHighCommand: Command {
    let ceilingFan: CeilingFan
    
    var previewSpeed: CeilingFan.Speed = .off
    
    init(ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
    }
    
    func excute() {
        self.previewSpeed = self.ceilingFan.speed
        
        self.ceilingFan.speed = .high
        
        debugPrint( "CeilingFanHighCommand, preview speed is \(self.previewSpeed)" )
    }
    
    func undo() {
        let speed = self.ceilingFan.speed
        self.ceilingFan.speed = previewSpeed
        self.previewSpeed = speed
    
        debugPrint( "CeilingFanHighCommand, undo to \(self.previewSpeed)" )
    }
}

class CeilingFanMediumCommand: Command {
    let ceilingFan: CeilingFan
    
    var previewSpeed: CeilingFan.Speed = .off
    
    init(ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
    }
    
    func excute() {
        self.previewSpeed = self.ceilingFan.speed
        
        self.ceilingFan.speed = .medium
        
        debugPrint( "CeilingFanMediumCommand, preview speed is \(self.previewSpeed)" )
    }
    
    func undo() {
        let speed = self.ceilingFan.speed
        self.ceilingFan.speed = previewSpeed
        self.previewSpeed = speed
        
        debugPrint( "CeilingFanHighCommand, undo to \(self.ceilingFan.speed)" )
    }
}

class CeilingFanOffCommand: Command {
    let ceilingFan: CeilingFan
    
    var previewSpeed: CeilingFan.Speed = .off
    
    init(ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
    }
    
    func excute() {
        self.previewSpeed = self.ceilingFan.speed
        
        self.ceilingFan.speed = .off
        
        debugPrint( "CeilingFanOffCommand, preview speed is \(self.previewSpeed)" )
    }
    
    func undo() {
        let speed = self.ceilingFan.speed
        self.ceilingFan.speed = previewSpeed
        self.previewSpeed = speed
        
        debugPrint( "CeilingFanOffCommand, undo to \(self.ceilingFan.speed)" )
    }
}

class CeilingFanLowCommand: Command {
    let ceilingFan: CeilingFan
    
    var previewSpeed: CeilingFan.Speed = .off
    
    init(ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
    }
    
    func excute() {
        self.previewSpeed = self.ceilingFan.speed
        
        self.ceilingFan.speed = .low
        
        debugPrint( "CeilingFanLowCommand, preview speed is \(self.previewSpeed)" )
    }
    
    func undo() {
        let speed = self.ceilingFan.speed
        self.ceilingFan.speed = previewSpeed
        self.previewSpeed = speed
        
        debugPrint( "CeilingFanLowCommand, undo to \(self.ceilingFan.speed)" )
    }
}

class NoCommand: Command {
    func excute() { }
    func undo() { }
}


class SimpleRemoteControl {
    
    var onCommands: [Command] = Array(repeating: NoCommand(), count: 7)
    var offCommands: [Command] = Array(repeating: NoCommand(), count: 7)
    var undoCommands: [Command] = Array(repeating: NoCommand(), count: 7)
    
    func setCommand(slot: Int, onCommand: Command, offCommand: Command) {
        self.onCommands[slot] = onCommand
        self.offCommands[slot] = offCommand
    }
    
    func onButtonWasPressed(at slot: Int) {
        self.onCommands[slot].excute()
        
        /// 记住当前执行的操作，undo 后就是当前的
        self.undoCommands[slot] = self.onCommands[slot]
    }
    
    func offButtonWasPressed(at slot: Int) {
        self.offCommands[slot].excute()
        
        /// 记住当前执行的操作，undo 后就是当前的
        self.undoCommands[slot] = self.offCommands[slot]
    }
    
    func undoButtonWasPressed() {
        for command in self.undoCommands {
            command.undo()
        }
    }
}
