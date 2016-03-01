//
//  ViewController.swift
//  ImprooAdmin
//
//  Created by 3axap on 28.02.16.
//  Copyright © 2016 SIC. All rights reserved.
//

import Cocoa
import Firebase

class ViewController: NSViewController {
    
    @IBOutlet weak var sectionPopUpButton: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionPopUpButton.removeAllItems()
        sectionPopUpButton.addItemsWithTitles(["Books","Articles","Courses"])
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func newItemAction(sender: NSButton) {
        switch self.sectionPopUpButton.selectedItem!.title {
        case "Books" : let newBookViewController = self.storyboard?.instantiateControllerWithIdentifier("NewBookViewController") as! NSViewController
        self.presentViewControllerAsModalWindow(newBookViewController)
        default : break
        }
    }
}

