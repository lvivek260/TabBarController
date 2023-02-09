//
//  DetailViewController.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var studentDetailTableView: UITableView!
    @IBOutlet weak var personImage: UIImageView!
    
    var studentData:Student?
    let imgeIcons:[UIImage] = [#imageLiteral(resourceName: "mobile") , #imageLiteral(resourceName: "email") , #imageLiteral(resourceName: "birthday") , #imageLiteral(resourceName: "branch") , #imageLiteral(resourceName: "ruppes")]
    var studentDataArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.text = studentData!.firstName + " " + studentData!.lastName
        imageSet()
        tableViewCellSet()
        studentDataArray.append(studentData!.mobile)
        studentDataArray.append(studentData!.email)
        studentDataArray.append(studentData!.birthday)
        studentDataArray.append(studentData!.branch)
        studentDataArray.append(studentData!.fees)
    }
    private func imageSet(){
        personImage.layer.cornerRadius = 60.0
        personImage.image = studentData?.studentImg
    }
    private func tableViewCellSet(){
        studentDetailTableView.delegate = self
        studentDetailTableView.dataSource = self
        let nib = UINib(nibName: "StudentDetailTableViewCell", bundle: nil)
        studentDetailTableView.register(nib, forCellReuseIdentifier: "StudentDetailTableViewCell")
    }
}

extension DetailViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgeIcons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentDetailTableView.dequeueReusableCell(withIdentifier: "StudentDetailTableViewCell", for: indexPath) as! StudentDetailTableViewCell
        cell.iconImage.image = imgeIcons[indexPath.row]
        cell.lableData.text = studentDataArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentDetailTableView.reloadData()
    }
}
