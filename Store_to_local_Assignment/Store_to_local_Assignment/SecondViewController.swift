//
//  SecondViewController.swift
//  Store_to_local_Assignment
//
//  Created by promact on 08/02/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtOccupation: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onSubmitClick(_ sender: Any) {
        //Validation Of all fields
        if let name = txtName.text, let age = txtAge.text, let email = txtEmail.text, let address = txtAddress.text, let phone = txtPhoneNumber.text, let occupation = txtOccupation.text {
            if name == "" && age == "" && email == "" && address == "" && phone == "" && occupation == "" {
                UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter values in fields")
            }else{
                if !name.isValidName(name: name){
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Name")
                }else if !age.isValidAge(age: age){
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Age")
                }else if !email.isValidEmail(email: email){
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Email")
                }else if address == ""{
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Address")
                }else if !phone.isValidNumber(number: phone){
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Valid Phone Number")
                }else if occupation == ""{
                    UtilityFunctions().simpleAlert(vc: self, title: "Alert!", message: "Please Enter Occupation")
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdScreen") as! ThirdViewController
                    vc.name = txtName.text!
                    vc.age = txtAge.text!
                    vc.email = txtEmail.text!
                    vc.address = txtAddress.text!
                    vc.phonenumber = txtPhoneNumber.text!
                    vc.occupation = txtOccupation.text!
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}


extension String {
    // using RegEx
    
    //Het Patel
    func isValidName(name: String) -> Bool {
        let nameRegEx = #"^[A-Za-z0-9_\s]*$"#
        let nameTest = NSPredicate (format: "SELF MATCHES %@", nameRegEx)
        let result = nameTest.evaluate (with: name)
        return result
    }
    
    // only numbers are allowed
    func isValidAge(age: String) -> Bool {
        let ageRegEx = "^[0-9]{2}$"
        let ageTest = NSPredicate (format: "SELF MATCHES %@", ageRegEx)
        let result = ageTest.evaluate (with: age)
        return result
    }
    
    //only 10 digits are allowed and prefix two characters like +91
    func isValidNumber(number: String) -> Bool {
        let numberRegEx = "^[+]?(?:[0-9]{2})?[0-9]{10}$"
        let numberTest = NSPredicate (format: "SELF MATCHES %@", numberRegEx)
        let result = numberTest.evaluate (with: number)
        return result
    }
}
