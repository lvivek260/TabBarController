//
//  ViewController.swift
//  TabBarController
//
//  Created by Admin on 06/02/23.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var addImage:UIButton!
    @IBOutlet weak var addDataTableView: UITableView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var mobileNumber_:String = "_"
    var email_:String = "_"
    var fess_:String = "_"
    var birthday_:String = "_"
    var studentImage_:UIImage?
    var dummyStudentImage:UIImage = #imageLiteral(resourceName: "person")
    var branch_:String = ""
    var mydatePicker = UIDatePicker()
    let arr:[String] = ["Phone Number","Email","Birthday","Fess"]
    var androidVcDelegate:AndroidStudentDataPassing?
    var passData:((Student)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDataTableView.delegate = self
        addDataTableView.dataSource = self
        nibFileRegister()
        SaveBarButtonItom()
    }
    
    func SaveBarButtonItom(){
        navigationItem.backBarButtonItem?.tintColor = .orange
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBtnClick))
        save.tintColor = .orange
        navigationItem.rightBarButtonItems = [save]
    }
    @objc func saveBtnClick(){
        if(firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty){
            print("Empty TextField Not Allowed")
        }
        else{
            if let textField1 = self.view.viewWithTag(0) as? UITextField{
                print(textField1.text!)
            }
            if studentImage_ == nil{
                studentImage_ = dummyStudentImage
            }
            let data:Student = Student(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, birthday: birthday_, branch: branch_, mobile: mobileNumber_, fees: fess_, email: email_,studentImg: (studentImage_! ))
           
            if(branch_ == "Android"){
                guard let delegate = androidVcDelegate else {
                    print("Delegate Not Set")
                    return
                }
                delegate.DataPassing(data: data)
            }
            else{
                passData!(data)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func ImageSelectButton(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .savedPhotosAlbum
        self.present(imagePicker, animated: true)
    }
    
    func nibFileRegister() {
        let nib1 = UINib(nibName: "PhoneNumberTableViewCell", bundle: nil)
        addDataTableView.register(nib1, forCellReuseIdentifier: "normalTxtCell")
        let nib2 = UINib(nibName: "DateOfBirthTableViewCell", bundle: nil)
        addDataTableView.register(nib2, forCellReuseIdentifier: "birthdayCell")
    }
}


extension AddStudentViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell1 = addDataTableView.dequeueReusableCell(withIdentifier: "normalTxtCell", for: indexPath) as! PhoneNumberTableViewCell
           
            cell1.nameLbl.text = "Mobile "
            cell1.textField.placeholder = "Number"
            cell1.textField.keyboardType = .numberPad
            mobileNumber_ = cell1.textField.text!
                return cell1
        }
        else if(indexPath.row == 1){
            let cell2 = addDataTableView.dequeueReusableCell(withIdentifier: "normalTxtCell", for: indexPath) as! PhoneNumberTableViewCell
            cell2.nameLbl.text = "Email  "
            cell2.textField.placeholder = "Id"
            cell2.textField.keyboardType = .emailAddress
            email_ = cell2.textField.text!
         
            return cell2
        }
        else if(indexPath.row == 2){
            let cell3 = addDataTableView.dequeueReusableCell(withIdentifier: "normalTxtCell", for: indexPath) as! PhoneNumberTableViewCell
            cell3.nameLbl.text = "Tuation"
            cell3.textField.placeholder = "Fess"
            cell3.textField.keyboardType = .numberPad
            fess_ = cell3.textField.text!
                return cell3
        }
        else if(indexPath.row == 3){
            let cell4 = addDataTableView.dequeueReusableCell(withIdentifier: "birthdayCell", for: indexPath) as! DateOfBirthTableViewCell
            mydatePicker = cell4.datePicker
            mydatePicker.addTarget(self, action: #selector(selectDate), for: .valueChanged)
            cell4.selectedDateLbl.text = birthday_
            cell4.datePicker.tintColor = .green
            return cell4
        }
        else{
            print("Index Number Not Found")
        }
       return UITableViewCell()
    }
    
    @objc
    func selectDate(){
        let dateformater = DateFormatter()
        dateformater.dateStyle = .medium
        birthday_ = dateformater.string(from: mydatePicker.date)
        print(birthday_)
        addDataTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0: return 80
        case 1: return 80
        case 2: return 80
        case 3: return 190
        default:
            return 0
        }
    }
}

extension AddStudentViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        studentImage_ = image
        let UIimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: addImage.frame.size.width, height: addImage.frame.size.height))
        UIimageView.image = studentImage_
        addImage.addSubview(UIimageView)
        addImage.imageView?.isHidden = true
        picker.dismiss(animated: true)
        
    }
}
