//
//  UploadViewController.swift
//  2023InstagramClone
//
//  Created by İbrahim Gülmez on 13.09.2023.
//

import UIKit
import Firebase
import FirebaseStorage
class UploadViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target:self , action: #selector(choosenImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func choosenImage(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }
    func  makeAlert(titleInput:String, massageInput:String) {
        let alert = UIAlertController(title: titleInput, message: massageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageRefence = storage.reference()
        let madiaFolder = storageRefence.child("media")
        
        
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let ImageReference = madiaFolder.child("\(uuid).jpg")
            ImageReference.putData(data , metadata:nil) { ( metadata, error ) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", massageInput: error?.localizedDescription ?? "Error")
                } else {
                    ImageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl": imageUrl!, "postedBy": Auth.auth().currentUser!.email!, "postComment": self.commentText.text! ,"date":FieldValue.serverTimestamp(), "likes": 0] as [String : Any ]
                            
                            
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data:firestorePost, completion: { (error) in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", massageInput: error!.localizedDescription )
                                    
                                } else {
                                    self.imageView.image = UIImage(named: "indirme")
                                    self.commentText.text! = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                            
                            
                        }
                        
                    }
                }
            }
        }
        
    }
}
 
