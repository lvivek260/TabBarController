//
//  PhoneNumberTableViewCell.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class PhoneNumberTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Cellbutton: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
