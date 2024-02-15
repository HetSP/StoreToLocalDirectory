//
//  ThirdViewController.swift
//  Store_to_local_Assignment
//
//  Created by promact on 08/02/24.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var lblOccupation: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var name = ""
    var age = ""
    var email = ""
    var address = ""
    var phonenumber = ""
    var occupation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = "Name: \(name)"
        lblAge.text = "Age: \(age)"
        lblEmail.text = "Email: \(email)"
        lblAddress.text = "Address: \(address)"
        lblPhoneNumber.text = "Phone: \(phonenumber)"
        lblOccupation.text = "Occupation: \(occupation)"
    }

}
