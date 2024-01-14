//
//  FeedCell.swift
//  2023InstagramClone
//
//  Created by İbrahim Gülmez on 13.09.2023.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var commentText: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeClicked(_ sender: Any) {
        let fireStoreDatabase = Firestore.firestore()
        if let likeCount = Int(likeLabel.text!){
            let LikeStore = ["likes" : likeCount + 1] as [String: Any]
            fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(LikeStore, merge: true)
        }
        
        
    }
}
