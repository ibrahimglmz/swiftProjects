//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by İbrahim Gülmez on 25.07.2023.
//

import UIKit

class detailsVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jopLabel: UILabel!
    
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        jopLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
    }
    

    
}
