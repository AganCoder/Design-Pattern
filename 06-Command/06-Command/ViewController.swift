//
//  ViewController.swift
//  06-Command
//
//  Created by Noah.Gao on 2022/8/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
              
        let ceilingFan = CeilingFan()
        
        let high = CeilingFanHighCommand(ceilingFan: ceilingFan)
        let medium = CeilingFanMediumCommand(ceilingFan: ceilingFan)
        let low = CeilingFanLowCommand(ceilingFan: ceilingFan)
        let off = CeilingFanOffCommand(ceilingFan: ceilingFan)
                                
        let simpleRemoteControl = SimpleRemoteControl()
        simpleRemoteControl.setCommand(slot: 0, onCommand: high, offCommand: off)
        simpleRemoteControl.setCommand(slot: 1, onCommand: medium, offCommand: off)
        simpleRemoteControl.setCommand(slot: 2, onCommand: low, offCommand: off)
        
                        
        simpleRemoteControl.onButtonWasPressed(at: 0)
        simpleRemoteControl.offButtonWasPressed(at: 0)
        simpleRemoteControl.onButtonWasPressed(at: 0)
        simpleRemoteControl.undoButtonWasPressed()
        simpleRemoteControl.undoButtonWasPressed()
        simpleRemoteControl.undoButtonWasPressed()
        simpleRemoteControl.undoButtonWasPressed()
        simpleRemoteControl.undoButtonWasPressed()
        simpleRemoteControl.undoButtonWasPressed()
        simpleRemoteControl.undoButtonWasPressed()
        
    }


}

