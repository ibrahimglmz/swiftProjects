//
//  TwoViewController.swift
//  SegueApp
//
//  Created by İbrahim Gülmez on 11.07.2023.
//

import UIKit

class TwoViewController: UIViewController {
    @IBOutlet weak var twoMyLabel: UILabel!
    
    @IBOutlet weak var nameTextTwo: UILabel!
    
    
    override func viewDidLoad() {
        nameTextTwo.text = myName
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    

}
