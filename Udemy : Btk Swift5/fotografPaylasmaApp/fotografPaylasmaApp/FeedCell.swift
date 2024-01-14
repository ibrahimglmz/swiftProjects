//
//  FeedCell.swift
//  fotografPaylasmaApp
//
//  Created by İbrahim Gülmez on 14.08.2023.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    
    @IBOutlet weak var kullaniciYorumText: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
