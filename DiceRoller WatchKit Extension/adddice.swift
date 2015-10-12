//
//  adddice.swift
//  DiceRoller
//
//  Created by Nicholas Largen on 10/5/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation


class adddice: WKInterfaceController {
    @IBAction func pickerupdate(value: Int)
    {
        DiceRollerCore.numDice = value
        
       
    }

    @IBOutlet var pickerout: WKInterfacePicker!
    var currdiceselected = 0
    override func awakeWithContext(context: AnyObject?) {
        
        super.awakeWithContext(context)
       
        
        var thePickerItems = [WKPickerItem]()
        for (var i = 0 ; i < 10000; i++)
        {
            thePickerItems.append(WKPickerItem())
            thePickerItems[i].title = "\(i)"
            thePickerItems[i].caption = "\(i)"
       }
        self.pickerout.setItems(thePickerItems)
        
        // Configure interface objects here.
    }

    @IBAction func addrolls()
    {
        DiceRollerCore.numdiceforeach.append(DiceRollerCore.numDice)
        DiceRollerCore.prefs.setObject(DiceRollerCore.numdiceforeach, forKey:"numdice")
        DiceRollerCore.prefs.synchronize()
       
        self.popToRootController()
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
