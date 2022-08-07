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
              
        let light = Light()
        
        let ceilingFan = CeilingFan()
        
        let high = CeilingFanAdapter(ceilingFan: ceilingFan, onSpeed: .high, offSpeed: .off)
        let medium = CeilingFanAdapter(ceilingFan: ceilingFan, onSpeed: .medium, offSpeed: .off)
        let low = CeilingFanAdapter(ceilingFan: ceilingFan, onSpeed: .low, offSpeed: .off)
                                                
        let simpleRemoteControl = SimpleRemoteControl()
        simpleRemoteControl.setDevice(slot: 0, device: light)
        simpleRemoteControl.setDevice(slot: 1, device: high)
        simpleRemoteControl.setDevice(slot: 2, device: medium)
        simpleRemoteControl.setDevice(slot: 3, device: low)
        
                        
        simpleRemoteControl.onButtonWasPressed(at: 0)
        simpleRemoteControl.offButtonWasPressed(at: 0)
        
        simpleRemoteControl.onButtonWasPressed(at: 1)
        simpleRemoteControl.onButtonWasPressed(at: 2)
        simpleRemoteControl.onButtonWasPressed(at: 3)
    }
    
    


}

