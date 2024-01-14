//
//  UploadViewController.swift
//  UdemyInstagramClone02
//
//  Created by İbrahim Gülmez on 28.08.2023.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage

class UploadViewController: UIViewController , UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    let ImageID = UUID()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var yorumText: UITextField!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosenImage))
        imageView.addGestureRecognizer(gestureRecognizer)

        
    }
    
    @objc func choosenImage(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true , completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true , completion: nil)
    }
    func makeAlert(titleInput:String, massageInput:String){
        let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
  
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let madiaFolder = storageReference.child("madia")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReference = madiaFolder.child("\(uuid).jpg")
         
            imageReference.putData(data, metadata : nil) { ( metadata , error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
                } else {
                    
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                        
                            //database//
                            
                            let firestoreDatabase = Firestore.firestore()
                                                       
                            var firestoreReference : DocumentReference? = nil
                            
                                                       
                            let firestorePost = ["imageUrl " : imageUrl! , "PostedBy" : Auth.auth().currentUser!.email!, "postComment": self.yorumText.text!, "date": FieldValue.serverTimestamp(), "likes":0] as [String : Any]
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument( data: firestorePost, completion: { (error) in
                                if error != nil {
                          
                            self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
                            
                                } else {
                                    self.imageView.image = UIImage(named: "indirme.png")
                                    self.yorumText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            }
                            )
                   
                        }
        }
        
        
    }
    
}
        
}
    
}

   
    }
