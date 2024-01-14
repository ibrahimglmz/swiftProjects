//
//  ViewController.swift
//  instagramClone-01
//
//  Created by İbrahim Gülmez on 10.08.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text!  != "" && passwordText.text! != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata , error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messegaInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
            
        }
        
       
        
        
    }
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail:emailText.text! , password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messegaInput: error?.localizedDescription ?? "Error")
                    
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messegaInput: "Username/Password?")
        }
       
    }
    func makeAlert(titleInput:String, messegaInput:String) {
        let alert = UIAlertController(title: titleInput ,message: messegaInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default , handler: nil)
        alert.addAction(okButton)
        self.present( alert, animated: true , completion: nil)
        
    }
    
}

