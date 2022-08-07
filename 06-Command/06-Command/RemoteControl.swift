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
}

class Light: SlotDevice {
    func on() { debugPrint( "Light on") }
    func off() { debugPrint( "Light off") }
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
    
    init(ceilingFan: CeilingFan, onSpeed: CeilingFan.Speed, offSpeed: CeilingFan.Speed = .off) {
        self.ceilingFan = ceilingFan
        self.onSpeed = onSpeed
        self.offSpeed = offSpeed
    }
    
    func on() {
        self.ceilingFan.speed = self.onSpeed
    }
    
    func off() {
        self.ceilingFan.speed = self.offSpeed
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
//
//    func undoButtonWasPressed() {
//        for command in self.undoCommands {
//            command.undo()
//        }
//    }
}
