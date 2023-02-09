//
//  AndroidViewController.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class AndroidViewController: UIViewController {

    @IBOutlet weak var androidStudentTableView: UITableView!
    var androidStudents:[Student] = [
        Student(firstName: "Govind", lastName:"Mane", birthday: "April 2, 2000", branch: "Android", mobile: "8421304231", fees: "26000", email: "govind@gmail.com", studentImg: #imageLiteral(resourceName: "govind")),
        Student(firstName: "King", lastName: "Kohli", birthday: "May 21, 1990", branch: "Android", mobile: "8381050131", fees: "26000", email: "king@gmail.com", studentImg: #imageLiteral(resourceName: "king")),
        Student(firstName: "Dada", lastName: "Madane", birthday: "Jan 2, 2000", branch: "Android", mobile: "8945989458", fees: "26000", email: "data@gmail.com", studentImg: #imageLiteral(resourceName: "data")),
        Student(firstName: "krishna", lastName: "Dudhabhate", birthday: "jun 1, 2000", branch: "Android", mobile: "993589833", fees: "26000", email: "krishan@gmail.com", studentImg: #imageLiteral(resourceName: "krishna")),
        Student(firstName: "Nikhil", lastName: "Kakde", birthday: "Feb 12, 2001", branch: "Android", mobile: "8743837443", fees: "26000", email: "nikhil@gmail.com", studentImg: #imageLiteral(resourceName: "nikhil")),
        Student(firstName: "Shubham", lastName: "Savant", birthday: "April 2, 2000", branch: "Android", mobile: "8421304231", fees: "26000", email: "shubham@gmail.com", studentImg: #imageLiteral(resourceName: "vivek")),
        Student(firstName: "Sathe", lastName: "Umesh", birthday: "May 21, 2000", branch: "Android", mobile: "8381050131", fees: "26000", email: "sam@gmail.com", studentImg: #imageLiteral(resourceName: "maharaj")),
        Student(firstName: "Vishal", lastName: "Cocsit", birthday: "Jan 2, 2000", branch: "Android", mobile: "8945989458", fees: "26000", email: "vishal@gmail.com", studentImg: #imageLiteral(resourceName: "vishal")),
        Student(firstName: "Rohit", lastName: "Vaghe", birthday: "jun 1, 2000", branch: "Android", mobile: "993589833", fees: "26000", email: "rohit@gmail.com", studentImg: #imageLiteral(resourceName: "yash"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = .orange
        self.view.backgroundColor = .darkGray
        androidStudentTableView.delegate = self
        androidStudentTableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        androidStudentTableView.register(nib, forCellReuseIdentifier: "studentCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func addAndroidStudent(_ sender: UIBarButtonItem) {
        let addStudentViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController") as! AddStudentViewController
        addStudentViewController.branch_ = "Android"
        addStudentViewController.androidVcDelegate = self
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(addStudentViewController, animated: true)
    }
    
}

extension AndroidViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return androidStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = androidStudentTableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.studentImage.image = androidStudents[indexPath.row].studentImg
        cell.studentImage.layer.masksToBounds  = false
        cell.studentImage.layer.cornerRadius = cell.studentImage.frame.height/2
        cell.studentImage.clipsToBounds = true
        cell.studentFullName.text = androidStudents[indexPath.row].firstName + " " + androidStudents[indexPath.row].lastName
        cell.backgroundColor = .darkGray
        cell.studentFullName.textColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.studentData = androidStudents[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
extension AndroidViewController:AndroidStudentDataPassing{
    func DataPassing(data: Student) {
        tabBarController?.tabBar.isHidden = false
        androidStudents.append(data)
        androidStudentTableView.reloadData()
    }
}
