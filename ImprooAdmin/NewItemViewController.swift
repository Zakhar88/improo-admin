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
    @IBOutlet weak var itemTitle: NSTextField?
    @IBOutlet weak var itemDescription: NSTextView?
    @IBOutlet weak var imageFileName: NSTextField?
    @IBOutlet weak var category1: NSPopUpButton?
    @IBOutlet weak var category2: NSPopUpButton?
    @IBOutlet weak var category3: NSPopUpButton?
    @IBOutlet weak var urlTextField: NSTextField?
    
    var chapter: String?
    var language: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillCategoriesLists()
    }
    
    func fillCategoriesLists() {
        category1?.addItems(withTitles: UkrainianBooksCategories)
        category2?.addItems(withTitles: [""] + UkrainianBooksCategories)
        category3?.addItems(withTitles: [""] + UkrainianBooksCategories)
    }
    
    @IBAction func saveAction(_ sender: NSButton) {
        
        guard let category1Title = category1?.selectedItem?.title,
            let language = language,
            let itemTitle = itemTitle?.stringValue,
            let chapter = chapter,
            let description = itemDescription?.string,
            !itemTitle.isEmpty,
            !description.isEmpty else {
                Swift.print("Fill all fields.")
                return
        }
        
        //Create array of categories
        var categoriesArray: [String] = [category1Title]
        if let category2Title = category2?.selectedItem?.title, !category2Title.isEmpty {
            categoriesArray.append(category2Title)
        }
        if let category3Title = category3?.selectedItem?.title, !category3Title.isEmpty {
            categoriesArray.append(category3Title)
        }
        
        //Create item dictioanry
        let mainInfo = ["title": itemTitle, "categories": categoriesArray] as [String : Any]
        var additionalInfo = ["description": description]
        if let imageName = imageFileName?.stringValue, !imageName.isEmpty {
            additionalInfo["imageFileName"] = imageName
        }
        if let itemUrl = urlTextField?.stringValue, !itemUrl.isEmpty {
            guard let _ = URL(string: itemUrl) else {
                Swift.print("URL contains characters that are illegal in a URL.")
                return
            }
            additionalInfo["url"] = itemUrl
        }
        let itemData = ["MainInfo": mainInfo,"AdditionalInfo": additionalInfo]
        
        FirebaseManager.sharedManager.saveItem(itemData as [String : AnyObject], withLanguage: language, chapter: chapter) { (error) in
            if let error = error {
                Swift.print(error)
            } else {
                self.cleanAllFields()
            }
        }
    }
    
    func cleanAllFields() {
        itemTitle?.stringValue = ""
        itemDescription?.string = ""
        imageFileName?.stringValue = ""
        category2?.selectItem(at: 0)
        category3?.selectItem(at: 0)
        urlTextField?.stringValue = ""
    }
}
