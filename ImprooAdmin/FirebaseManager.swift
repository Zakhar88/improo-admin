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
                    print(error!)
                }
            }
        }
    }
    
    func saveItem(_ itemData: [String: AnyObject], withLanguage language: String, chapter: String, completion: @escaping (Error?) -> Void) {
        let itemRef = rootRef?.child(byAppendingPath: language).child(byAppendingPath: chapter)
        
        itemRef?.child(byAppendingPath: "AdditionalInfo").childByAutoId().setValue(itemData["AdditionalInfo"]) { (error, snapshot) -> Void in
            if error == nil {
                itemRef?.child(byAppendingPath: "MainInfo").child(byAppendingPath: snapshot?.key).setValue(itemData["MainInfo"])  { (error, snapshot) -> Void in
                    completion(error)
                }
            } else {
                completion(error)
            }
        }
    
    }
    
    func updateItem(_ bookDictionary: [String:AnyClass]) {
        
    }
    
    func removeItemWithID(_ id:String) {
        
    }
    
    func loadItemsWithLanguage(_ language: String, chapter: String, toDictioanary bookDictionary: [String:AnyClass]) {
        
    }
}
