//
//  Student.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit
class Student{
    var studentImg:UIImage
    var firstName:String
    var lastName:String
    var birthday:String
    var branch:String
    var mobile:String
    var fees:String
    var email:String
    
    init(firstName: String, lastName: String, birthday: String, branch: String, mobile: String, fees: String, email: String, studentImg:UIImage) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.branch = branch
        self.mobile = mobile
        self.fees = fees
        self.email = email
        self.studentImg = studentImg
    }
}
