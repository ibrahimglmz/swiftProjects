//
//  ViewController.swift
//  SidApp
//
//  Created by İbrahim Gülmez on 29.05.2023.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score = 0
    var sidArray = [UIImageView]()
    var highScore = 0


    
    @IBOutlet weak var sid1: UIImageView!
    
    @IBOutlet weak var sid2: UIImageView!
    
    @IBOutlet weak var sid3: UIImageView!
    
    @IBOutlet weak var sid4: UIImageView!
    
    @IBOutlet weak var sid5: UIImageView!
    
    @IBOutlet weak var sid6: UIImageView!
    
    @IBOutlet weak var sid7: UIImageView!
    
    @IBOutlet weak var sid8: UIImageView!
    
    @IBOutlet weak var sid9: UIImageView!
    
    @IBOutlet weak var sid10: UIImageView!
    
    @IBOutlet weak var sid11: UIImageView!
    
    @IBOutlet weak var sid12: UIImageView!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var hightScoreLabel: UILabel!

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scoreLabel.text = "Score: \(score)"
        
        //Highscore check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            hightScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            hightScoreLabel.text = "Highscore: \(highScore)"
        }
        
        
        
        //images
        sid1.isUserInteractionEnabled = true
        sid2.isUserInteractionEnabled = true
        sid3.isUserInteractionEnabled = true
        sid4.isUserInteractionEnabled = true
        sid5.isUserInteractionEnabled = true
        sid6.isUserInteractionEnabled = true
        sid7.isUserInteractionEnabled = true
        sid8.isUserInteractionEnabled = true
        sid9.isUserInteractionEnabled = true
        sid10.isUserInteractionEnabled = true
        sid11.isUserInteractionEnabled = true
        sid12.isUserInteractionEnabled = true
        


        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        sid1.addGestureRecognizer(recognizer1)
        sid2.addGestureRecognizer(recognizer2)
        sid3.addGestureRecognizer(recognizer3)
        sid4.addGestureRecognizer(recognizer4)
        sid5.addGestureRecognizer(recognizer5)
        sid6.addGestureRecognizer(recognizer6)
        sid7.addGestureRecognizer(recognizer7)
        sid8.addGestureRecognizer(recognizer8)
        sid9.addGestureRecognizer(recognizer9)
        sid10.addGestureRecognizer(recognizer9)
        sid11.addGestureRecognizer(recognizer9)
        sid12.addGestureRecognizer(recognizer9)
        
        sidArray = [sid1, sid2, sid3, sid4, sid5, sid6, sid7, sid8, sid9,sid10,sid11,sid12]
        
        
        //Timers
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideSid), userInfo: nil, repeats: true)
        
        hideSid()
    }
    
    @objc func hideSid(){
        
        for sid in sidArray {
            sid.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(sidArray.count - 1)))
        sidArray[random].isHidden = false
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate() //timer durdurucu
            hideTimer.invalidate()
            
            for sid in sidArray {
                sid.isHidden = true
            }
            
            //HighScore
            
            if self.score > self.highScore {
                self.highScore = self.score
               hightScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            //Alert
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //to add replay
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 25
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideSid), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }


}
        
        
