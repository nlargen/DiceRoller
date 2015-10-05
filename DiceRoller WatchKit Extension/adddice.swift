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

    @IBOutlet var pickerout: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var thePickerItems = [WKPickerItem]()
        let tablevals = ["D4","D6","D8","D10","D12","D20","D100"]
        let theimages = ["d4.jpeg","d6.jpeg","d8.jpeg", "d10.jpeg","d12.jpeg","d20.jpg","d100.jpeg"]
        for (var i = 0 ; i < tablevals.count; i++)
        {
            thePickerItems.append(WKPickerItem())
            thePickerItems[i].title =  tablevals[i]
            thePickerItems[i].caption = tablevals[i]
            thePickerItems[i].contentImage = WKImage(imageName:theimages[i])
        }
        self.pickerout.setItems(thePickerItems)

        // Configure interface objects here.
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
