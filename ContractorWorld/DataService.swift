//
//  DataService.swift
//  ContractorWorld
//
//  Created by Grandon Lin on 2018-04-08.
//  Copyright © 2018 Grandon Lin. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()

var userName: String!

class DataService {
    
    static let ds = DataService()
    var uid = KeychainWrapper.standard.string(forKey: KEY_UID)
    
    //DB references
    private var _REF_BASE = DB_BASE
    private var _REF_CONTRACTORS = DB_BASE.child("Contractors")
    private var _REF_USERS = DB_BASE.child("Users")
    //private var _REF_PROFILE = DB_BASE.child("profile")
    
    //STORAGE references
    private var _STORAGE_PROFILE_IMAGE = STORAGE_BASE.child("Contractors")
//    private var _POST_IMAGE = STORAGE_BASE.child("post_pic")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_CONTRACTORS: DatabaseReference {
        return _REF_CONTRACTORS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_USERS_CURRENT: DatabaseReference {
        let user = DataService.ds._REF_USERS.child(uid!)
        return user
    }
    
//    var REF_USERS_CURRENT_LIKE: DatabaseReference {
//        return REF_USERS_CURRENT.child("myLikes")
//    }
    
    var STORAGE_PROFILE_IMAGE: StorageReference {
        return _STORAGE_PROFILE_IMAGE
    }
//
//    var POST_IMAGE: StorageReference {
//        return _POST_IMAGE
//    }
    
    func createFirebaseDBUser(uid: String, profileData: Dictionary<String, String>) {
        //        let profileKey = REF_USERS.child(uid).child("profile").childByAutoId().key
        //        REF_USERS.child(uid).child("profile").child("\(profileKey)").updateChildValues(profileData)
        REF_USERS.child(uid).child("profile").updateChildValues(profileData)
        
        
    }
}
