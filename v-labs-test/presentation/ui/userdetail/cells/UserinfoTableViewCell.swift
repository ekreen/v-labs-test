//
//  UserinfoTableViewCell.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import UIKit

class UserinfoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UserinfoTableViewCell {
    func populate(with userWrapper: UserViewDataWrapper) {
        nameLabel.text = userWrapper.user.name
        companyLabel.text = userWrapper.company
        emailLabel.text = userWrapper.email
        phoneLabel.text = userWrapper.phone
        websiteLabel.text = userWrapper.website
    }
}
