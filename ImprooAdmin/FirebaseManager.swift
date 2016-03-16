//
//  FirebaseManager.swift
//  ImprooAdmin
//
//  Created by 3axap on 29.02.16.
//  Copyright © 2016 GZZ. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    static let sharedManager = FirebaseManager()
    
    let rootRef = Firebase(url: "https://improo.firebaseio.com/")
    
    func login() {
        if rootRef.authData == nil {
            rootRef.authUser("g3axap@gmail.com", password: "3axap30558") { (error: NSError!, authData: FAuthData!) -> Void in
                if error != nil {
                    print(error)
                }
            }
        }
    }
    
    //    var languages: [String] = [String]()
    //    var bookCategories: [String] = [String]()
    
    func saveBook(bookData: [String:AnyObject], withLanguage language: String) {
        let booksRef = rootRef.childByAppendingPath(language).childByAppendingPath("Books")
        
        booksRef.childByAppendingPath("BooksCoverAndDescription").childByAutoId().setValue(bookData["bookCoverAndDescription"]) { (error, snapshot) -> Void in
            if error == nil {
                booksRef.childByAppendingPath("BooksInfo").childByAppendingPath(snapshot.key).setValue(bookData["bookInfo"])
            }
        }
    
    }
    
    func updateBook(bookDictionary: [String:AnyClass]) {
        
    }
    
    func removeBookWithID(id:String) {
        
    }
    
    func loadBooksWithLanguage(language: String, toDictioanary bookDictionary: [String:AnyClass]) {
        
    }
}
