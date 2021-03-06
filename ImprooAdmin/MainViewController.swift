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
    
    @IBOutlet weak var sectionPopUpButton: NSPopUpButton?
    @IBOutlet weak var languagePopUpButton: NSPopUpButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionPopUpButton?.addItems(withTitles: Chapters.allChapters)
        languagePopUpButton?.addItems(withTitles: Languages.allLanguages)
        
        FirebaseManager.sharedManager.login()
        //addCategoriesForUkrainian()
    }
    
    @IBAction func newItemAction(_ sender: NSButton) {
        let newItemStoryboard = NSStoryboard(name: "NewItem", bundle: nil)
        let newItemViewController = newItemStoryboard.instantiateController(withIdentifier: "NewItemViewController") as! NewItemViewController
        newItemViewController.chapter = sectionPopUpButton?.selectedItem?.title
        newItemViewController.language = languagePopUpButton?.selectedItem?.title
        self.presentViewControllerAsModalWindow(newItemViewController)
    }
    
    func addCategoriesForUkrainian() {
        FirebaseManager.sharedManager.rootRef?.child(byAppendingPath: Languages.Ukrainian.rawValue).child(byAppendingPath: "Categories").setValue(Categories.ukrainian.Books)
    }
}

