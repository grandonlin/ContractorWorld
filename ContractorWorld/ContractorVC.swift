//
//  ContractorVC.swift
//  ContractorWorld
//
//  Created by Grandon Lin on 2018-04-07.
//  Copyright © 2018 Grandon Lin. All rights reserved.
//

import UIKit
import Firebase

class ContractorVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contractorListTableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var contractorList = [Contractor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contractorListTableView.delegate = self
        contractorListTableView.dataSource = self
        
        listChange(segmentControl)

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contractorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\(indexPath.count)")
        let contractor = contractorList[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contractorListTableViewCell") as? contractorListTableViewCell {
            cell.configureCell(contractor: contractor)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ContractorDetailVC", sender: nil)
    }
    
    @IBAction func listChange(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = segmentControl.selectedSegmentIndex
        switch selectedSegmentIndex {
        case 0:
            fetchAllContractor()
        case 1:
            fetchContractorByFavourite()
        case 2:
            fetchContractorByName()
        default:
            fetchAllContractor()
            break
        }
    }
    
    func fetchAllContractor() {
        contractorList.removeAll()
        let ref = DataService.ds.REF_CONTRACTORS
        ref.queryOrderedByKey().observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if let contractorDict = snap.value as? Dictionary<String, Any> {
                        let key = snap.key
                        let contractor = Contractor(key: key, contractorDict: contractorDict)
                        self.contractorList.append(contractor)
                        self.contractorListTableView.reloadData()
                    }
                }
            }
        })
    }
    
    func fetchContractorByFavourite() {
        
    }
    
    func fetchContractorByName() {
        
    }
    
    func locateUserArea() {
        
    }
}




/*
if let contractorDict = snap.value as? Dictionary<String, Any> {
    if let contractorProfileImageURL = contractorDict["Profile Image URL"] as? String {
        let profileImageRef = Storage.storage().reference(forURL: contractorProfileImageURL)
        profileImageRef.getData(maxSize: 1024 * 1024, completion: { (data, error) in
            if error != nil {
                print("Grandon(ProfileVC): the error is \(error)")
            } else {
                if let img = UIImage(data: data!) {
                    if let addressData = contractorDict["Address"] as? Dictionary<String, String> {
                        let street = addressData["Street"]
                        let city = addressData["City"]
                        let province = addressData["Province_State"]
                        let country = addressData["Country"]
                        let postal = addressData["Postal"]
                        let contractorAddress = "\(street) \(city) \(province) \(postal) \(country)"
                        let contractorProfileImage = img
                        let contractorName = contractorDict["Name"] as! String
                        let contractorCompany = contractorDict["Company Name"] as! String
                        let likesNumber = contractorDict["Likes"] as! Int
                        let key = snap.key
                        let contractor = Contractor(contractorKey: key, contractorName: contractorName, contractorCompany: contractorCompany, contractorAddress: contractorAddress, profileImage: contractorProfileImage, likes: likesNumber)
                        self.contractorList.append(contractor)
                        self.contractorListTableView.reloadData()
                    }
                    
                }
            }
        })
    }
}

*/
