//
//  ViewController.swift
//  ExamplesSimApp
//
//  Created by İbrahim Gülmez on 13.07.2023.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    var timer = Timer()
    var counter = 0
    var coulleArry = [UIImageView]()
    var hideTimer = Timer()
    var yüksekScore = 0
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hightScore: UILabel!
    
    
    
    @IBOutlet weak var collou1: UIImageView!
    @IBOutlet weak var collou2: UIImageView!
    @IBOutlet weak var collou3: UIImageView!
    @IBOutlet weak var collou4: UIImageView!
    @IBOutlet weak var collou5: UIImageView!
    @IBOutlet weak var collou6: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score \(score)"
        
        let storedHihgt
        
    }


}

