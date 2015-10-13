//
//  RollTypeController.swift
//  DiceRoller
//
//  Created by Nicholas Largen on 10/12/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation


class RollTypeController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBAction func Attackbutton()
    {
        DiceRollerCore.rolltype.append("Attack")
        DiceRollerCore.prefs.setObject(DiceRollerCore.rolltype, forKey:"rolltype")
    }
    
    @IBAction func Defensebutton()
    {
        DiceRollerCore.rolltype.append("Defense")
        DiceRollerCore.prefs.setObject(DiceRollerCore.rolltype, forKey:"rolltype")

    }
    
    @IBAction func Healbutton()
    {
        DiceRollerCore.rolltype.append("Heal")
        DiceRollerCore.prefs.setObject(DiceRollerCore.rolltype, forKey:"rolltype")
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
