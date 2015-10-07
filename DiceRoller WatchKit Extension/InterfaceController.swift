//
//  InterfaceController.swift
//  DiceRoller WatchKit Extension
//
//  Created by Nicholas Largen on 10/2/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController

{
    @IBOutlet var dicetable: WKInterfaceTable!
    
   let alert = WKAlertAction(title: "ok", style: WKAlertActionStyle.Cancel, handler: {() -> Void in})
    let theimages = ["d4.jpeg","d6.jpeg","d8.jpeg", "d10.jpeg","d12.jpeg","d20.jpg","d100.jpeg"]
    let tablevals = ["D4","D6","D8","D10","D12","D20","D100"]
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
                // Configure interface objects here.
    }
    @IBAction func calculateroll()
    {
        self.presentAlertControllerWithTitle("The Roll", message: "\(DiceRollerCore.whichdiceselected * DiceRollerCore.numDice)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
        
       
    }
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        self.dicetable.setNumberOfRows(DiceRollerCore.numdiceforeach.count, withRowType: "dicetable")
        for(var i = 0; i < DiceRollerCore.numdiceforeach.count; i++)
        {
            let currRow = self.dicetable.rowControllerAtIndex(i) as! tablecell
            currRow.dicelabel.setText( " D \(DiceRollerCore.diceselected[i])")
            currRow.rolllabel.setText("\(DiceRollerCore.numdiceforeach[i])")
            
            
            
        }
        

        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
