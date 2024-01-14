//
//  ViewController.swift
//  SimpsonuYakalaApp
//
//  Created by İbrahim Gülmez on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 0
    var simArry = [UIImageView]()
    var hideTimer = Timer()
    var hightScore = 0

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hightScoreLabel: UILabel!
    
    
    
    @IBOutlet weak var sim1: UIImageView!
    @IBOutlet weak var sim2: UIImageView!
    @IBOutlet weak var sim3: UIImageView!
    @IBOutlet weak var sim4: UIImageView!
    @IBOutlet weak var sim5: UIImageView!
    @IBOutlet weak var sim6: UIImageView!
    @IBOutlet weak var sim7: UIImageView!
    @IBOutlet weak var sim8: UIImageView!
    @IBOutlet weak var sim9: UIImageView!
    @IBOutlet weak var sim10: UIImageView!
    @IBOutlet weak var sim11: UIImageView!
    @IBOutlet weak var sim12: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "score : \(score)"
        
        let storedHightScore = UserDefaults.standard.object(forKey: "hightScore")
        if storedHightScore  == nil{
            hightScore = 0
            hightScoreLabel.text = "hightScore: \(hightScore)"
        }
        if let newScore = storedHightScore as? Int{
            hightScore = newScore
            hightScoreLabel.text = "hightScore \(hightScore)"
        }
        sim1.isUserInteractionEnabled = true
        sim2.isUserInteractionEnabled = true
        sim3.isUserInteractionEnabled = true
        sim4.isUserInteractionEnabled = true
        sim5.isUserInteractionEnabled = true
        sim6.isUserInteractionEnabled = true
        sim7.isUserInteractionEnabled = true
        sim8.isUserInteractionEnabled = true
        sim9.isUserInteractionEnabled = true
        sim10.isUserInteractionEnabled = true
        sim11.isUserInteractionEnabled = true
        sim12.isUserInteractionEnabled = true
        
        
        
        
        
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        sim1.addGestureRecognizer(recognizer1)
        sim2.addGestureRecognizer(recognizer2)
        sim3.addGestureRecognizer(recognizer3)
        sim4.addGestureRecognizer(recognizer4)
        sim5.addGestureRecognizer(recognizer5)
        sim6.addGestureRecognizer(recognizer6)
        sim7.addGestureRecognizer(recognizer7)
        sim8.addGestureRecognizer(recognizer8)
        sim9.addGestureRecognizer(recognizer9)
        sim10.addGestureRecognizer(recognizer10)
        sim11.addGestureRecognizer(recognizer11)
        sim12.addGestureRecognizer(recognizer12)
        simArry = [sim1,sim2,sim3,sim4,sim5,sim6,sim7,sim8,sim9,sim10,sim11,sim12]
        
        counter = 20
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideSim), userInfo: nil, repeats: true)
        
        
        hideSim()
    
        
    }
    
    
    @objc func hideSim() {
        for sim  in simArry {
            sim.isHidden = true
        }
        
        
        if self.score > self.hightScore{
            self.hightScore = self.score
            hightScoreLabel.text =  "HightScore: \(self.hightScore)"
            UserDefaults.standard.set(self.hightScore, forKey: "hightScore")
        }
        
        let random = Int(arc4random_uniform(UInt32(simArry.count - 1)))
        simArry[random].isHidden = false
        
    }
    
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        if counter == 0 {
            timer.invalidate()
            
            
            
            hideTimer.invalidate()
            
            
            
            for sim  in simArry {
                sim.isHidden = true
            }
            
            
            let alert = UIAlertController(title: "Süre Doldu", message: "Tekrar Oynayınız", preferredStyle: UIAlertController.Style.alert)
            let okButton =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel,handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default){
                (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 20
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideSim), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert,animated: true,completion: nil)
        }
    }


}

