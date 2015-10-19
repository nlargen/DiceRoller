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
    @IBOutlet var ModeLabel: WKInterfaceLabel!
    @IBOutlet var dicetable: WKInterfaceTable!
    
   let alert = WKAlertAction(title: "ok", style: WKAlertActionStyle.Cancel, handler: {() -> Void in})
    let theimages = ["d4.jpeg","d6.jpeg","d8.jpeg", "d10.jpeg","d12.jpeg","d20.jpg","d100.jpeg"]
    let tablevals = ["D4","D6","D8","D10","D12","D20","D100"]
    let rollAlert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in })
    let deleteAlertCancel = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.Cancel, handler: { () -> Void in print("Canceled Delete")})
    let deleteAlertConfirm = WKAlertAction(title: "Confirm", style: WKAlertActionStyle.Cancel, handler: { () -> Void in  //Delete the current row from theRolls
        //DiceRollerCore.theRolls.removeAtIndex(???)
        //updateUserDefaults()
        //generateTable()
    })
   
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        DiceRollerCore.numdiceforeach = DiceRollerCore.prefs.valueForKey("numdice") as! NSArray as! [Int]
        DiceRollerCore.diceselected = DiceRollerCore.prefs.valueForKey("whichdice") as! NSArray as! [Int]

                // Configure interface objects here.
    }
    func generatetable(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        DiceRollerCore.toroll = 0
        DiceRollerCore.rollsides = 0
        DiceRollerCore.rolltotal = 0
        DiceRollerCore.toroll = DiceRollerCore.numdiceforeach[rowIndex]
        DiceRollerCore.rollsides = DiceRollerCore.diceselected[rowIndex]
        
    }
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        if(DiceRollerCore.rollmode == "Roll")
        {
            self.presentAlertControllerWithTitle("The Roll", message: DiceRollerCore.toroll[rowIndex].roll(), preferredStyle: WKAlertControllerStyle.Alert, actions: [rollAlert])
            
        }
        else if(DiceRollerCore.rollmode == "Edit")
        {
            self.presentAlertControllerWithTitle("The Roll", message: "Edit", preferredStyle: WKAlertControllerStyle.Alert, actions: [rollAlert])
        }
        else if(DiceRollerCore.rollmode == "Delete")
        {
            self.presentAlertControllerWithTitle("** Delete **", message: "Confirm Delete?", preferredStyle: WKAlertControllerStyle.Alert, actions: [deleteAlertCancel, deleteAlertConfirm])
        }
    }

    @IBAction func calculateroll()
    {
        DiceRollerCore.rolltotal = 0
        for(var i = 0; i < DiceRollerCore.toroll;i++)
        {
        
            DiceRollerCore.rolltotal = DiceRollerCore.rolltotal + (Int((rand()%Int32(DiceRollerCore.rollsides)+1)))
            
         self.presentAlertControllerWithTitle("The Roll", message: "\(DiceRollerCore.rolltotal)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
        }
    }
    //Context menu actions
    
    @IBAction func RollContextButtonPressed()
    {
        print("roll")
        DiceRollerCore.rollmode = "Roll"
    }
    @IBAction func EditContextButtonPressed()
    {
        print("Edit")
        DiceRollerCore.rollmode = "Edit"
        self.pushControllerWithName("TypeRollController", context: 0)
        

    }
    @IBAction func DeleteContextButtonPressed()
    {
        print("Del")
        DiceRollerCore.rollmode = "Delete"
        
    }
    func updateModeLabel()
    {
        self.ModeLabel.setText("Mode: \(DiceRollerCore.rollmode)")
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
        print(DiceRollerCore.prefs.valueForKey("whichdice")!)
    
        DiceRollerCore.prefs.synchronize()
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
