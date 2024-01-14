//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by İbrahim Gülmez on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        let storeName = UserDefaults.standard.object(forKey: "name")
        let storeBirthday = UserDefaults.standard.object(forKey: "birthday")

        if let  myName = storeName as? String{
            nameLabel.text = myName
        }
        if let mybirthday = storeBirthday as? String{
            birthdayLabel.text = mybirthday
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }


    @IBAction func SaveButton(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text!,forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!,forKey: "birthday")
        
        
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        let strodName = UserDefaults.standard.object(forKey: "name")
        let strodBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (strodName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name"
        }
        
        if (strodBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "birthday"
            
        }
    }
    
}

