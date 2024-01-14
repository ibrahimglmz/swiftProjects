//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by İbrahim Gülmez on 3.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var cbpLabel: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changeButtonClicked(_ sender: Any) {
        
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=334bf497d8e52c09995a061599b595d0")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default ,handler: nil)
                self.present(alert,animated: true,completion: nil)
            } else {
                if data != nil {
                    do {
                        
                     let jsonResponse = try    JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary  < String , Any >
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String:Any] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.cbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let turklira = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turklira)"
                                }
                               
                            }
                        }
                        
                        
                        
                    } catch {
                        print("Error")
                    }
                }
            }
        }
        
        task.resume()
    }
    
}

