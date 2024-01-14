//
//  ViewController.swift
//  MyFirstApp
//
//  Created by İbrahim Gülmez on 6.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func button(_ sender: Any) {
        imageView.image = UIImage(named:"ibrahimportre" )
    }
}

