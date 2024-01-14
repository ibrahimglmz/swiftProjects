//
//  ViewController.swift
//  UdemyInstagramClone02
//
//  Created by İbrahim Gülmez on 28.08.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error ) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        } else {
            self.makeAlert(titleInput: "Error", messageInput: "Username/ password ?")
        }
       
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
              if error != nil{
                  self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription  ?? "Error")
                  
                    
              } else {
                  self.performSegue(withIdentifier: "toFeedVC", sender: nil)
              }
            }
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username/ password ?")
            
        }
      
    }
    
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: "Error", message: "Username/ password ?" , preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default ,  handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true , completion:  nil)
        
    }
}

