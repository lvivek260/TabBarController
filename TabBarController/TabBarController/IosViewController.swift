//
//  IosViewController.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class IosViewController: UIViewController {
    
    @IBOutlet weak var iosStudentTableView: UITableView!
    var iosStudents:[Student] = [
        Student(firstName: "Vivek", lastName: "Lokhande", birthday: "April 2, 2000", branch: "Ios", mobile: "8421304231", fees: "26000", email: "vivek@gmail.com", studentImg: #imageLiteral(resourceName: "vivek")),
        Student(firstName: "Sam", lastName: "Lokhande", birthday: "May 21, 2000", branch: "Ios", mobile: "8381050131", fees: "26000", email: "sam@gmail.com", studentImg: #imageLiteral(resourceName: "sam")),
        Student(firstName: "Avishkar", lastName: "Kakde", birthday: "Jan 2, 2000", branch: "Ios", mobile: "8945989458", fees: "26000", email: "avishkar@gmail.com", studentImg: #imageLiteral(resourceName: "avi")),
        Student(firstName: "Lakhan", lastName: "Bansode", birthday: "jun 1, 2000", branch: "Ios", mobile: "993589833", fees: "26000", email: "lakhan@gmail.com", studentImg: #imageLiteral(resourceName: "dnyanu")),
        Student(firstName: "Pavan", lastName: "Kakde", birthday: "Feb 12, 2001", branch: "Ios", mobile: "8743837443", fees: "26000", email: "pavan@gmail.com", studentImg: #imageLiteral(resourceName: "akshay")),
        Student(firstName: "Shubham", lastName: "Savant", birthday: "April 2, 2000", branch: "Ios", mobile: "8421304231", fees: "26000", email: "shubham@gmail.com", studentImg: #imageLiteral(resourceName: "shubham")),
        Student(firstName: "Sathe", lastName: "Umesh", birthday: "May 21, 2000", branch: "Ios", mobile: "8381050131", fees: "26000", email: "sam@gmail.com", studentImg: #imageLiteral(resourceName: "sudhir")),
        Student(firstName: "Vishal", lastName: "Cocsit", birthday: "Jan 2, 2000", branch: "Ios", mobile: "8945989458", fees: "26000", email: "vishal@gmail.com", studentImg: #imageLiteral(resourceName: "vishal")),
        Student(firstName: "Rohit", lastName: "Vaghe", birthday: "jun 1, 2000", branch: "Ios", mobile: "993589833", fees: "26000", email: "rohit@gmail.com", studentImg: #imageLiteral(resourceName: "rohit"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = .orange
        iosStudentTableView.delegate = self
        iosStudentTableView.dataSource = self
        registerNibFile()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func registerNibFile(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        iosStudentTableView.register(nib, forCellReuseIdentifier: "studentCell")
    }
    @IBAction func addIosStudent(_ sender: UIBarButtonItem) {
        let addStudentViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController") as! AddStudentViewController
        addStudentViewController.branch_ = "Ios"
        addStudentViewController.passData = {
            (data) in
            self.iosStudents.append(data)
            self.iosStudentTableView.reloadData()
        }
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(addStudentViewController, animated: true)
    }
}

extension IosViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iosStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = iosStudentTableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        
        cell.studentImage.image = iosStudents[indexPath.row].studentImg
        cell.studentImage.layer.masksToBounds  = false
        cell.studentImage.layer.cornerRadius = cell.studentImage.frame.height/2
        cell.studentImage.clipsToBounds = true
        cell.studentFullName.text = iosStudents[indexPath.row].firstName + " " + iosStudents[indexPath.row].lastName
        cell.backgroundColor = .darkGray
        cell.studentFullName.textColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.studentData = iosStudents[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
