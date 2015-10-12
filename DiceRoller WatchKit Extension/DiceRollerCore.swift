//
//  DiceRollerCore.swift
//  DiceRoller
//
//  Created by Nicholas Largen on 10/5/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit

class DiceRollerCore: NSObject
{
   static let prefs = NSUserDefaults.standardUserDefaults()
    static var numSides = 0
    static var numDice = -1
    static var whichdiceselected = 0
    static var diceselected = [Int]()
    static var numdiceforeach = [Int]()
    
    static var toroll = 0
    static var rollsides = 0
    static var rolltotal = 0

}
