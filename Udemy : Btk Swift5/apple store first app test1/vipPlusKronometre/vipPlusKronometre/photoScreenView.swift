//
//  photoScreenView.swift
//  vipPlusKronometre
//
//  Created by İbrahim Gülmez on 23.08.2023.
//

import UIKit

class photoScreenView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(eklemeButtonKıklandı))
    }
    
    
    @objc func  eklemeButtonKıklandı(){
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }



}
