//
//  ViewController.swift
//  AlertProject
//
//  Created by İbrahim Gülmez on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNametext: UITextField!
    
    @IBOutlet weak var passawordText: UITextField!
    
    @IBOutlet weak var twoPassawordText: UITextField!
    
    
    
    
    override func viewDidLoad() {
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpTiklandi(_ sender: Any) {
        
        
        if userNametext.text == "" {
            let alert = UIAlertController(title: "Error", message: "Username Not Found", preferredStyle:UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil)
            alert.addAction(okButton)
            
            self.present(alert,animated: true)
            }
            
        else if passawordText.text == "" {
                let alert = UIAlertController(title: "Error", message: "Passaword Not Found", preferredStyle:UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil)
                alert.addAction(okButton)
                
                self.present(alert,animated: true)
            }
        else if passawordText.text != twoPassawordText.text {
            let alert = UIAlertController(title: "Error", message: "Parola aynı değil", preferredStyle:UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil)
            alert.addAction(okButton)
            self.present(alert,animated: true)
            
        }
        else  {
           
            let alert = UIAlertController(title: "Good", message: "Kullanici adi ve paralo doğru ", preferredStyle:UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil)
            alert.addAction(okButton)
            self.present(alert,animated: true)
            
        }
        
        
    }
   
}
    


