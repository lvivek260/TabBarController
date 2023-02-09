//
//  StudentDetailTableViewCell.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class StudentDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var lableData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
