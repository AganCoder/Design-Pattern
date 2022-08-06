////
////  Command.swift
////  06-Command
////
////  Created by Noah.Gao on 2022/8/1.
////
//
//import Foundation
//
// 
//protocol Command {
//    func excute()
//}
//
//class Cook {
//    func makeCake() {
//        debugPrint( "make cake" )
//    }
//    
//    func makeTurkey() {
//        debugPrint( "make turkey" )
//    }
//}
//
//class CakeCommand: Command {
//    let cook: Cook
//    
//    init(cook: Cook) {
//        self.cook = cook
//    }
//    
//    func excute() {
//        cook.makeCake()
//    }
//}
//
//class TurkeyCommand: Command {
//    let cook: Cook
//    init(cook: Cook) {
//        self.cook = cook
//    }
//    
//    func excute() {
//        cook.makeTurkey()
//    }
//}
//
///// client
//class Customer {
//    func createOrder() {
//        
//        /// Invoker
//        let waitress = Waitress()
//        
//        // Receiver
//        let cook = Cook()
//        
//        /// Command: CakeCommand
//        /// Receiver Cook
//        let cakeCommand = CakeCommand(cook: cook)
//        
//        /// Command:  TurkeyCommand
//        /// Receiver: cook
//        let turkeyCommand = TurkeyCommand(cook: cook)
//        
//                
//        /// setCommand
//        waitress.takeCommand(command: cakeCommand)
//        waitress.takeCommand(command: turkeyCommand)
//                        
//        /// trigger
//        waitress.orderUp()
//    }
//}
//
//class Waitress {
//    
//    var commands: [Command] = []
//    
//    func takeCommand(command: Command) {
//        self.commands.append(command)
//    }
//    
//    func orderUp() {
//        self.commands.forEach( { $0.excute() } )
//    }
//}
