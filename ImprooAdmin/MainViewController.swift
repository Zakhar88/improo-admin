//
//  ViewController.swift
//  ImprooAdmin
//
//  Created by 3axap on 28.02.16.
//  Copyright © 2016 GZZ. All rights reserved.
//

import Cocoa
import Firebase

class MainViewController: NSViewController {
    
    @IBOutlet weak var sectionPopUpButton: NSPopUpButton!
    @IBOutlet weak var languagePopUpButton: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionPopUpButton.addItemsWithTitles(Chapters.allChapters)
        languagePopUpButton.addItemsWithTitles(Languages.allLanguages)

        FirebaseManager.sharedManager.login()
    }

    @IBAction func newItemAction(sender: NSButton) {
        switch self.sectionPopUpButton.selectedItem!.title {
        case Chapters.Books.rawValue :
            let booksStoryboard = NSStoryboard(name: "Books", bundle: nil)
            let newBookViewController = booksStoryboard.instantiateControllerWithIdentifier("NewBookViewController") as! NSViewController
            self.presentViewControllerAsModalWindow(newBookViewController)
        default : break
        }
    }
    
    func addCategoriesForUkrainian() {
        FirebaseManager.sharedManager.rootRef.childByAppendingPath(Languages.Ukrainian.rawValue).childByAppendingPath("Categories").setValue(Categories.Ukrainian.Books)
    }
}

