//
//  ViewController.swift
//  vipPlusKronometre
//
//  Created by İbrahim Gülmez on 22.08.2023.
//

import UIKit


class ViewController: UIViewController  {
  
    
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    
    
    @IBAction func girisYapTiklandi(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func kayıtOlTiklandi(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            
        }
    }
    
}

