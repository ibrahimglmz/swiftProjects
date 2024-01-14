//
//  SettingsViewController.swift
//  instagramClone-01
//
//  Created by İbrahim Gülmez on 10.08.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("Error")
        }
    }
    
}

