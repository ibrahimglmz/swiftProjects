//
//  UploadViewController.swift
//  instagramClone-01
//
//  Created by İbrahim Gülmez on 10.08.2023.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseCore

class UploadViewController: UIViewController  , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        imageView.isUserInteractionEnabled = true
        let gestureRocognizer = UITapGestureRecognizer(target: self, action: #selector(choosenImage))
        imageView.addGestureRecognizer(gestureRocognizer)
        super.viewDidLoad()

     
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
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController (title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.present(alert , animated: true, completion: nil)
    }
    
    @IBAction func actionButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let strogeReference = storage.reference()
        let madiaFolder = strogeReference.child("madia/")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageReference = madiaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { (metadata, error)  in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            
                            
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference?  = nil
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email!, "postComment" :self.commentText.text!, "data" : "data" , "like": 0 ] as [String: Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!")
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
