//
//  contractorListTableViewCell.swift
//  ContractorWorld
//
//  Created by Grandon Lin on 2018-04-07.
//  Copyright © 2018 Grandon Lin. All rights reserved.
//

import UIKit
import Firebase

class contractorListTableViewCell: UITableViewCell {

    @IBOutlet weak var contractorProfileImageView: UIImageView!
    @IBOutlet weak var contractorNameLabel: UILabel!
    @IBOutlet weak var contractorCompanyLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(contractor: Contractor) {
        let ref = Storage.storage().reference(forURL: contractor.contractorProfileImageURL)
        ref.getData(maxSize: 1024 * 1024, completion: { (data, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                self.contractorProfileImageView.image = image
            }
        })
        contractorNameLabel.text = contractor.contractorName
        contractorCompanyLabel.text = contractor.contractorCompany
        likeNumberLabel.text = "\(contractor.contractorLikesNumber)"
    }
    
}
