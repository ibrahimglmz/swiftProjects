//
//  uploadViewController.swift
//  fotografPaylasmaUygulamasi
//
//  Created by İbrahim Gülmez on 27.05.2023.
//

import UIKit
import Firebase

class uploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var yorumTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(gorselsec))
        ImageView.addGestureRecognizer(gestureRecognizer)
    }
    @objc func gorselsec(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType  = .photoLibrary
        present(pickerController,animated: true,completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func UploadTiklandi(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        if let data = ImageView.image?.jpegData(compressionQuality: 0.5){
            
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil){ (storagemetadata, error) in
                if error != nil {
                    
                } else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            print(imageUrl)
                        }
                        
                    }
                }
            }
            
        }
        
        
                }
    func hataMesajiGöster(){
        let alert = UIAlertController(title:String, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
    }
            }
            

// 11.9 ve 11.10 videolarını tekrar ızle
// hata sadece  uploud tıklandı kısmında var ne oldugunu hala anlayamadım  vıdeıları tekrar ızle gerekırse  11.8 ı de tekrar ızle
// 28 mayıs 02.13 gün sonu raporu 
