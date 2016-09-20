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
        if rootRef?.authData == nil {
            rootRef?.authUser("g3axap@gmail.com", password: "3axap30558") { (error: Error?, authData: FAuthData?) -> Void in
                if error != nil {
                    print(error)
                }
            }
        }
    }
    
    //    var languages: [String] = [String]()
    //    var bookCategories: [String] = [String]()
    
    func saveBook(_ bookData: [String:AnyObject], withLanguage language: String) {
        let booksRef = rootRef?.child(byAppendingPath: language).child(byAppendingPath: "Books")
        
        booksRef?.child(byAppendingPath: "BooksCoverAndDescription").childByAutoId().setValue(bookData["bookCoverAndDescription"]) { (error, snapshot) -> Void in
            if error == nil {
                booksRef?.child(byAppendingPath: "BooksInfo").child(byAppendingPath: snapshot?.key).setValue(bookData["bookInfo"])
            }
        }
    
    }
    
    func updateBook(_ bookDictionary: [String:AnyClass]) {
        
    }
    
    func removeBookWithID(_ id:String) {
        
    }
    
    func loadBooksWithLanguage(_ language: String, toDictioanary bookDictionary: [String:AnyClass]) {
        
    }
}
