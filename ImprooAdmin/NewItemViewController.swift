//
//  NewItemViewController.swift
//  ImprooAdmin
//
//  Created by 3axap on 28.02.16.
//  Copyright © 2016 GZZ. All rights reserved.
//

import Cocoa
import Firebase

let UkrainianBooksCategories = Categories.ukrainian.Books

class NewItemViewController: NSViewController {
    @IBOutlet weak var itemTitle: NSTextField!
    @IBOutlet weak var itemDescription: NSTextView!
    @IBOutlet weak var imageURL: NSTextField!
    @IBOutlet weak var category1: NSPopUpButton!
    @IBOutlet weak var category2: NSPopUpButton!
    @IBOutlet weak var category3: NSPopUpButton!
    @IBOutlet weak var language: NSPopUpButton!
    
    @IBOutlet weak var image: NSImageView!
    
    var chapter: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillCategoriesLists()
        
        self.language.addItems(withTitles: ["Ukrainian"])
    }
    
    func fillCategoriesLists() {
        self.category1.addItems(withTitles: UkrainianBooksCategories)
        self.category2.addItems(withTitles: [""] + UkrainianBooksCategories)
        self.category3.addItems(withTitles: [""] + UkrainianBooksCategories)
    }
    
    @IBAction func saveAction(_ sender: NSButton) {
        
        //Create array of categories
        var categoriesArray: [String] = [(self.category1.selectedItem?.title)!]
        if self.category2.selectedItem?.title != "" {
            categoriesArray.append((self.category2.selectedItem?.title)!)
        }
        if self.category3.selectedItem?.title != "" {
            categoriesArray.append((self.category3.selectedItem?.title)!)
        }
        
        //Create item dictioanry
        let info = ["title": self.itemTitle.stringValue,
            "categories":categoriesArray] as [String : Any]
        
        var coverAndDescription = ["description":(self.itemDescription.textStorage?.string)!]
        
        if self.imageURL.stringValue.isEmpty {
            coverAndDescription["image"] = "NO IMAGE DATA"
            let itemData = ["info": info,"coverAndDescription":coverAndDescription]
            FirebaseManager.sharedManager.saveItem(itemData as [String : AnyObject], withLanguage: (self.language.selectedItem?.title)!, chapter: chapter)
        } else {
            let imageUrl = URL(string: self.imageURL.stringValue)
            let imageData = try? Data(contentsOf: imageUrl!)
            if let base64String = imageData?.base64EncodedString(options: .lineLength64Characters) {
                coverAndDescription["image"] = base64String
                let itemData = ["bookInfo": info,"coverAndDescription": coverAndDescription]
                FirebaseManager.sharedManager.saveItem(itemData as [String : AnyObject], withLanguage: (self.language.selectedItem?.title)!, chapter: chapter)
            } else {
                print("ERROR LOADING IMAGE")
            }
        }
    }
}
