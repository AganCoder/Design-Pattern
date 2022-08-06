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
              
        /// Receiver
        let light = Light()
        
        /// Command
        let lightOnCommand = LightOnCommand(light: light)
        
        /// Invoker
        let simpleRemoteControl = SimpleRemoteControl()
        
        /// 讲 Invoker 与 Command 关联起来
        simpleRemoteControl.setCommand(command: lightOnCommand)
        
        /// Invoker触发事件
        simpleRemoteControl.buttonWasPressed()
    }


}

