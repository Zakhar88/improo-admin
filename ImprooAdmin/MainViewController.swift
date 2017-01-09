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
        sectionPopUpButton.addItems(withTitles: Chapters.allChapters)
        languagePopUpButton.addItems(withTitles: Languages.allLanguages)

        FirebaseManager.sharedManager.login()
    }

    @IBAction func newItemAction(_ sender: NSButton) {
        switch self.sectionPopUpButton.selectedItem!.title {
        case Chapters.Books.rawValue :
            let booksStoryboard = NSStoryboard(name: "NewItem", bundle: nil)
            let newBookViewController = booksStoryboard.instantiateController(withIdentifier: "NewItemViewController") as! NewItemViewController
            self.presentViewControllerAsModalWindow(newBookViewController)
        default : break
        }
    }
    
    func addCategoriesForUkrainian() {
        FirebaseManager.sharedManager.rootRef?.child(byAppendingPath: Languages.Ukrainian.rawValue).child(byAppendingPath: "Categories").setValue(Categories.ukrainian.Books)
    }
}

