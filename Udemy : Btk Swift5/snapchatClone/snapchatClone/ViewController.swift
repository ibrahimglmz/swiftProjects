//
//  ViewController.swift
//  snapchatClone
//
//  Created by İbrahim Gülmez on 22.08.2023.
//

import UIKit
import Firebase
import FirebaseCore

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var userNameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if passwordText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text! , password: passwordText.text! ) { (result , error) in
                if error !=  nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error ")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
        } else {
            self.makeAlert(title: "Error", message: "Password/ Email ? ")
        }
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text  != "" && passwordText.text != "" && userNameText.text != ""  {
            Auth.auth().createUser(withEmail: emailText.text! , password: passwordText.text!) { (auth , error ) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error ")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictionary = ["email" :  self.emailText.text!, "Username" : self.userNameText.text!] as [String : Any]
                    
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error ) in
                        if error != nil {
                            
                        }
                    }
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        } else {
            self.makeAlert(title: "Error", message: "Username / Passaword ?")
            
        }
    }
    
    func makeAlert(title : String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert , animated: true , completion: nil)
        
    }
    
}

