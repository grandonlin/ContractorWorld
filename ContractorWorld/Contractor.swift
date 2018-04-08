//
//  Contractor.swift
//  ContractorWorld
//
//  Created by Grandon Lin on 2018-04-07.
//  Copyright © 2018 Grandon Lin. All rights reserved.
//

import UIKit
import Firebase

class Contractor {
    
    private var _contractorKey: String!
    private var _contractorName: String!
    private var _contractorCompany: String!
    private var _contractorProfileImageURL: String!
    private var _contractorLikesNumber: Int!
    private var _contractorAddress: String!
    
    init() {
        _contractorKey = ""
        _contractorName = ""
        _contractorCompany = ""
        _contractorProfileImageURL = ""
        _contractorAddress = ""
        _contractorLikesNumber = 0
    }
    
//    init(contractorKey: String, contractorName: String, contractorCompany: String, contractorAddress: String, profileImage: UIImage, likes: Int) {
//        _contractorKey = contractorKey
//        _contractorName = contractorName
//        _contractorCompany = contractorCompany
//        _contractorProfileImage = profileImage
//        _contractorAddress = contractorAddress
//        _contractorLikesNumber = likes
//    }
    
    init(key: String, contractorDict: Dictionary<String, Any>) {
        self._contractorKey = key
        
        if let name = contractorDict["Name"] as? String {
            self._contractorName = name
        }
        
        if let companyName = contractorDict["Company Name"] as? String {
            self._contractorCompany = companyName
        }
        
        if let likes = contractorDict["Likes"] as? Int {
            self._contractorLikesNumber = likes
        }
        
        if let imageUrl = contractorDict["Profile Image URL"] as? String {
            self._contractorProfileImageURL = imageUrl
        }
        
        if let addressData = contractorDict["Address"] as? Dictionary<String, String> {
            let street = addressData["Street"]
            let city = addressData["City"]
            let province = addressData["Province_State"]
            let postal = addressData["Postal"]
            let country = addressData["Country"]
            self._contractorAddress = "\(street), \(city), \(province), \(postal), \(country)"
        }
        
    }

    
    var contractorKey: String {
        get {
            return _contractorKey
        }
        set {
            _contractorKey = newValue
        }
    }
    
    var contractorName: String {
        get {
            return _contractorName
        }
        set {
            _contractorName = newValue
        }
    }
    
    var contractorCompany: String {
        get {
            return _contractorCompany
        }
        set {
            _contractorCompany = newValue
        }
    }
    
    var contractorAddress: String {
        get {
            return _contractorAddress
        }
        set {
            _contractorAddress = newValue
        }
    }
    
    var contractorProfileImageURL: String {
        get {
            return _contractorProfileImageURL
        }
        set {
            _contractorProfileImageURL = newValue
        }
    }
    
    var contractorLikesNumber: Int {
        get {
            return _contractorLikesNumber
        }
        set {
            _contractorLikesNumber = newValue
        }
        
    }
}
