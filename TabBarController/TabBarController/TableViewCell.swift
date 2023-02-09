//
//  TableViewCell.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var studentFullName: UILabel!
    @IBOutlet weak var studentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
