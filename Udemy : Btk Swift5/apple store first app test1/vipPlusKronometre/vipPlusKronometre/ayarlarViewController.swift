//
//  ayarlarViewController.swift
//  vipPlusKronometre
//
//  Created by İbrahim Gülmez on 22.08.2023.
//

import UIKit

class ayarlarViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func CıkısYapTiklandi(_ sender: Any) {
        performSegue(withIdentifier: "toSettingsVC", sender: nil)
    }
    
}
