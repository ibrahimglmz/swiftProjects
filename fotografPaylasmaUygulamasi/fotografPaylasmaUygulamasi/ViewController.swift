//
//  ViewController.swift
//  fotografPaylasmaUygulamasi
//
//  Created by İbrahim Gülmez on 27.05.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var sifreTextfield: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisYapTiklandi(_ sender: Any) {
        if emailTextField.text != "" && sifreTextfield.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password:sifreTextfield.text!) {
                (authdataresult , error) in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata Aldınız tekrar deneyınız")
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
                self.hataMesaji(titleInput: "hata", messageInput: "Email ve Parola Giriniz")
            }
    }
    
    @IBAction func kayitYapTiklandi(_ sender: Any) {
        if emailTextField.text != "" && sifreTextfield.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextfield.text!) { (authdataresult, error) in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata Aldiniz Tekrar Deneyiniz")
                    
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }
        else{
            hataMesaji(titleInput: "hata", messageInput: "Email ve Parola Giriniz")
            
        }
    }
    func hataMesaji(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
}

