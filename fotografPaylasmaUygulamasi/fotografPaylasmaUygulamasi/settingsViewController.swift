//
//  settingsViewController.swift
//  fotografPaylasmaUygulamasi
//
//  Created by İbrahim Gülmez on 27.05.2023.
//

import UIKit
import Firebase

class settingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cikisYapTiklandi(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("HATA")
            
        }
    }
}
