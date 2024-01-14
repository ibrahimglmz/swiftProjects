//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by İbrahim Gülmez on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    

    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gesture)
    }
    @objc func  changePic(){
        imageView.image = UIImage(named: "homer simspson")
        myLabel.text = "homer simspson"
    }

}

