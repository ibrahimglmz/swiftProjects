//
//  FeedViewController.swift
//  UdemyInstagramClone02
//
//  Created by İbrahim Gülmez on 28.08.2023.
//

import UIKit
import SDWebImage
import Firebase

class FeedViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
 
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
         getDataFromFirestore()
    }
    func getDataFromFirestore(){
        
        
        let fireStoreDatabase = Firestore.firestore()
 
    
        
        fireStoreDatabase.collection("Posts").addSnapshotListener { (snaphot, error) in
            if error != nil {
                print(error?.localizedDescription)
                
            } else {
                if snaphot?.isEmpty != true   &&  snaphot != nil {
                    
                    for document in snaphot!.documents {
                        
                        let documentID = document.documentID
                  
                        
                        if let PostedBy = document.get("PostedBy") as? String {
                            self.userEmailArray.append(PostedBy)
                        }
                        
                        if let postComment = document.get("postComment") as? String{
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int{
                            self.likeArray.append(likes)
                        }
                        if let imageUrl = document.get("imageUrl") as? String{
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
                
            }
        }
    }
        
        
    func tableView(_ _tableView:UITableView,numberOfRowsInSection section: Int ) -> Int {
            return userEmailArray.count
        }
        
        
        
       
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",  for: indexPath) as! feedCell
            
            cell.userEmailLabel.text = userEmailArray[indexPath.row]
            cell.likeLabel.text = String(likeArray[indexPath.row])
            cell.commentLabel.text  = userCommentArray[indexPath.row]
            cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
            return cell
        }
        
        
    }




