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
        let lightOnCommand = LightOnCommand(light: light)
        let lightOffCommand = LightOffCommand(light: light)
                
        let simpleRemoteControl = SimpleRemoteControl()
        simpleRemoteControl.setCommand(slot: 1, onCommand: lightOnCommand, offCommand: lightOffCommand)
        
        debugPrint(simpleRemoteControl.onCommands)
        debugPrint(simpleRemoteControl.offCommands)
    }


}

