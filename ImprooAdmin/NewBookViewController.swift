//
//  NewBookViewController.swift
//  ImprooAdmin
//
//  Created by 3axap on 28.02.16.
//  Copyright © 2016 SIC. All rights reserved.
//

import Cocoa
import Firebase

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
        self.bookCategory1.addItemsWithTitles(["","Мотивація","Психологія","Художні"])
        self.bookCategory2.addItemsWithTitles(["","Мотивація","Психологія","Художні"])
        self.bookLanguage.addItemsWithTitles(["Ukr","Eng"])
        
        print(bookCategory1.titleOfSelectedItem!)
    }
    
    @IBAction func saveBookAction(sender: NSButton) {
        //Create dictionary
        let bookAuthor = ["bookAuthor":self.bookAuthor.stringValue]
        let bookTitle = ["bookTitle":self.bookTitle.stringValue]
        let bookDescription = ["bookDescription":self.bookDescription.textStorage?.string]
        
        // Load image:
        let imageUrl = NSURL(string: self.imageURL.stringValue)
        let downloadTask = NSURLSession.sharedSession().downloadTaskWithURL(imageUrl!) { (location, response, error) -> Void in
            let imageData = NSData(contentsOfURL: location!)
            let base64String = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
            let imageURL = ["imageURL":base64String]
            
        }.resume()
    }
}
