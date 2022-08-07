//
//  RemoteController.swift
//  06-Command
//
//  Created by Noah.Gao on 2022/8/3.
//

import Foundation

protocol SlotDevice {
    func on()
    func off()
    func undo()
}

class Light: SlotDevice {
    
    var ison: Bool = false
    
    func on() { debugPrint( "Light on") }
    func off() { debugPrint( "Light off") }
    func undo() {
        self.ison ? self.off() : self.on()
    }
}


class CeilingFan {
    enum Speed {
        case off
        case high
        case medium
        case low
    }
    
    var speed: Speed = .off {
        didSet {
            debugPrint("set speed to \(self.speed)")
        }
    }
}

class CeilingFanAdapter: SlotDevice {
    
    let ceilingFan: CeilingFan
    let onSpeed: CeilingFan.Speed
    let offSpeed: CeilingFan.Speed
    var previewSpeed: CeilingFan.Speed = .off
    
    init(ceilingFan: CeilingFan, onSpeed: CeilingFan.Speed, offSpeed: CeilingFan.Speed = .off) {
        self.ceilingFan = ceilingFan
        self.onSpeed = onSpeed
        self.offSpeed = offSpeed
    }
    
    func on() {
        self.ceilingFan.speed = self.onSpeed
        self.previewSpeed = self.ceilingFan.speed
    }
    
    func off() {
        self.ceilingFan.speed = self.offSpeed
        
        self.previewSpeed = self.ceilingFan.speed
    }
    
    func undo() {
        let speed = self.ceilingFan.speed
        self.ceilingFan.speed = self.previewSpeed
        
        self.previewSpeed = speed
    }
}



class SimpleRemoteControl {
    
    var slots: [SlotDevice?] = Array(repeating: nil, count: 7)

    func setDevice(slot: Int, device: SlotDevice) {
        self.slots[slot] = device
    }

    func onButtonWasPressed(at slot: Int) {
        self.slots[slot]?.on()
    }

    func offButtonWasPressed(at slot: Int) {
        self.slots[slot]?.off()
    }

    func undoButtonWasPressed() {
        for slot in self.self.slots {
            slot?.undo()
        }
    }
}
