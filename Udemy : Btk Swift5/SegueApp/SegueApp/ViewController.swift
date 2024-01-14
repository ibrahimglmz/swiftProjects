//
//  ViewController.swift
//  SegueApp
//
//  Created by İbrahim Gülmez on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var oneMyLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
     var myName = " "
    var Username = " "
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        oneMyLabel.text = myName
        
        
    }
    @IBAction func nextButton(_ sender: Any) {
        Username =  nameText.text!
        var userName = nameText.text!
        performSegue(withIdentifier: "toSecondVc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVc" {
            let destinationVC = segue.destination as! TwoViewController destinationVC.m = Username
        }
    }
}

