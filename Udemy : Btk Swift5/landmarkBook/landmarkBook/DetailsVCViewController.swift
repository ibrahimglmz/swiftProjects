//
//  DetailsVCViewController.swift
//  landmarkBook
//
//  Created by İbrahim Gülmez on 23.07.2023.
//

import UIKit

class DetailsVCViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landMarkLabel: UILabel!
    
    var selectedLandMarkName = ""
    var SelectedLandMarkImage = UIImage()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landMarkLabel.text = selectedLandMarkName
        imageView.image = SelectedLandMarkImage
        

    
    }
    

    

}
