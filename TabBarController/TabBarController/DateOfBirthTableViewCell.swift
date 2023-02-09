//
//  DateOfBirthTableViewCell.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class DateOfBirthTableViewCell: UITableViewCell {

    @IBOutlet weak var selectedDateLbl: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
