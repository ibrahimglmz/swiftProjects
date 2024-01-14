//
//  UploadViewController.swift
//  fotografPaylasmaApp
//
//  Created by İbrahim Gülmez on 14.08.2023.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class UploadViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var yorumText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func gorselSec(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true , completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage]  as?  UIImage
        self.dismiss(animated: true,completion: nil)
    }
    
    
    
    
    
    @IBAction func saveClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let madiaFolder = storageReference.child("madia")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageReference = madiaFolder.child("\(uuid).jpg")
            imageReference.putData(data , metadata: nil) { (strogametadata , error) in
                if error != nil {
                    self.hataMesajıGöster(tittle: "Hata", messega: error?.localizedDescription ?? "Error")
                } else {
                    imageReference.downloadURL { [self] (url, error)  in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            let firestoreDatabase = Firestore.firestore()
                            if let imageUrl = imageUrl  {
                                let firestoreDatabase = Firestore.firestore()
                                let firestorePost = ["gorselurl" : imageUrl, "yorum" : self.yorumText.text! , "email" :  Auth.auth().currentUser!.email  , "tarih" : FieldValue.serverTimestamp() ] as [String: Any]
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost) {
                                    (error) in
                                    if error != nil {
                                        self.hataMesajıGöster(tittle: "Post", messega: error?.localizedDescription ?? "hata Aldiniz")
                                    } else {
                                        self.yorumText.text = ""
                                        self.imageView.image = UIImage(named: "images")
                                        self.tabBarController?.selectedIndex = 0
                                        
                                    }
                                }
                                
                            }
                            
                            
                        }
                    }
                    
                }
            }
        }
        
    }
    
    func hataMesajıGöster(tittle : String , messega: String) {
        let alert = UIAlertController(title: tittle, message: messega, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default , handler:  nil)
        alert.addAction(okButton)
        self.present(alert , animated: true , completion: nil)
    }
}




