//
//  buttonaddcontroller.swift
//  DiceRoller
//
//  Created by Nicholas Largen on 10/5/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation

class buttonaddcontroller: WKInterfaceController {
    
    override func awakeWithContext(context: AnyObject?) {
        
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    @IBAction func d4buttonclick()
    {
        DiceRollerCore.whichdiceselected = 4
        DiceRollerCore.diceselected.append(4)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D4")
        print(DiceRollerCore.whichdiceselected)
    }
    
    @IBAction func D6buttonclick()
    {
        DiceRollerCore.whichdiceselected = 6
        DiceRollerCore.diceselected.append(6)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D6")
    }
    
    @IBAction func D8buttonclick()
    {
        DiceRollerCore.whichdiceselected = 8
        DiceRollerCore.diceselected.append(8)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D8")
    }
    @IBAction func D10buttonclick()
    {
        DiceRollerCore.whichdiceselected = 10
        DiceRollerCore.diceselected.append(10)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D10")
    }
    
    @IBAction func D12buttonclick()
    {
        DiceRollerCore.whichdiceselected = 12
        DiceRollerCore.diceselected.append(12)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D12")
    }
    @IBAction func D20buttonclick()
    {
        DiceRollerCore.whichdiceselected = 20
        DiceRollerCore.diceselected.append(20)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D20")
    }
    @IBAction func D100ButtonClick()
    {
        DiceRollerCore.whichdiceselected = 100
        DiceRollerCore.diceselected.append(100)
        DiceRollerCore.prefs.setObject(DiceRollerCore.diceselected, forKey: "whichdice")
        self.pushControllerWithName("AddDice", context: "D100")
    }
   
    override func willActivate() {
        
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
