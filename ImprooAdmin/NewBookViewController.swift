//
//  NewBookViewController.swift
//  ImprooAdmin
//
//  Created by 3axap on 28.02.16.
//  Copyright © 2016 GZZ. All rights reserved.
//

import Cocoa
import Firebase

let UkrainianBooksCategories = Categories.ukrainian.Books

class NewBookViewController: NSViewController {
    
    @IBOutlet weak var bookAuthor: NSTextField!
    @IBOutlet weak var bookTitle: NSTextField!
    @IBOutlet var bookDescription: NSTextView!
    @IBOutlet weak var imageURL: NSTextField!
    @IBOutlet weak var bookCategory1: NSPopUpButton!
    @IBOutlet weak var bookCategory2: NSPopUpButton!
    @IBOutlet weak var bookCategory3: NSPopUpButton!
    @IBOutlet weak var bookLanguage: NSPopUpButton!
    
    @IBOutlet weak var image: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillBookCategoriesLists()
        
        self.bookLanguage.addItems(withTitles: ["Ukrainian","English"])
    }
    
    func fillBookCategoriesLists() {
        self.bookCategory1.addItems(withTitles: UkrainianBooksCategories)
        self.bookCategory2.addItems(withTitles: [""] + UkrainianBooksCategories)
        self.bookCategory3.addItems(withTitles: [""] + UkrainianBooksCategories)
    }
    
    @IBAction func saveBookAction(_ sender: NSButton) {
        
        //Create array of categories
        var categoriesArray: [String] = [(self.bookCategory1.selectedItem?.title)!]
        if self.bookCategory2.selectedItem?.title != "" {
            categoriesArray.append((self.bookCategory2.selectedItem?.title)!)
        }
        if self.bookCategory3.selectedItem?.title != "" {
            categoriesArray.append((self.bookCategory3.selectedItem?.title)!)
        }
        
        //Create book dictioanry
        let bookInfo = ["author":self.bookAuthor.stringValue,
            "title":self.bookTitle.stringValue,
            "categories":categoriesArray] as [String : Any]
        
        var bookCoverAndDescription = ["description":(self.bookDescription.textStorage?.string)!]
        
        if self.imageURL.stringValue.isEmpty {
            bookCoverAndDescription["image"] = "NO IMAGE DATA"
            let bookData = ["bookInfo":bookInfo,"bookCoverAndDescription":bookCoverAndDescription]
            FirebaseManager.sharedManager.saveBook(bookData as [String : AnyObject], withLanguage: (self.bookLanguage.selectedItem?.title)!)
        } else {
            let imageUrl = URL(string: self.imageURL.stringValue)
            let imageData = try? Data(contentsOf: imageUrl!)
            if let base64String = imageData?.base64EncodedString(options: .lineLength64Characters) {
                bookCoverAndDescription["image"] = base64String
                let bookData = ["bookInfo":bookInfo,"bookCoverAndDescription":bookCoverAndDescription]
                FirebaseManager.sharedManager.saveBook(bookData as [String : AnyObject], withLanguage: (self.bookLanguage.selectedItem?.title)!)
            } else {
                print("ERROR LOADING IMAGE")
            }
        }
    }
}
