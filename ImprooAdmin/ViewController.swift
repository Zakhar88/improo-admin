//
//  ViewController.swift
//  ImprooAdmin
//
//  Created by 3axap on 28.02.16.
//  Copyright © 2016 SIC. All rights reserved.
//

import Cocoa
import Firebase

enum Language : String {
    case Ukrainian = "Ukrainian"
    case English = "English"
    case Russian = "Russian"
}

class ViewController: NSViewController {
    
    @IBOutlet weak var sectionPopUpButton: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionPopUpButton.addItemsWithTitles(["Books","Articles","Courses"])
        FirebaseManager.sharedManager.login()
    }

    @IBAction func newItemAction(sender: NSButton) {
        switch self.sectionPopUpButton.selectedItem!.title {
        case "Books" : let newBookViewController = self.storyboard?.instantiateControllerWithIdentifier("NewBookViewController") as! NSViewController
        self.presentViewControllerAsModalWindow(newBookViewController)
        default : break
        }
    }
    
    func addCategoriesForUkrainian() {
        FirebaseManager.sharedManager.rootRef.childByAppendingPath(Language.Ukrainian.rawValue).childByAppendingPath("Categories").setValue(["Мотивація", "Психологія", "Художні", "Творчість", "Комплексний розвиток", "Стосунки", "Кар'єра" ,"Спорт", "Харчування", "Здоров'я"])
    }
}

