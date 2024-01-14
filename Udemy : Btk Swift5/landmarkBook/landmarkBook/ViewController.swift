//
//  ViewController.swift
//  landmarkBook
//
//  Created by İbrahim Gülmez on 23.07.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    

    @IBOutlet weak var tableView: UITableView!
    var LandMarkNames = [String]()
    var LandMarkImages = [UIImage]()
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
       
        LandMarkNames.append("istanbul")
        LandMarkNames.append("greek")
        LandMarkNames.append("italy")
        LandMarkNames.append("kremlin")
        LandMarkNames.append("tajmahal")
        
         
        LandMarkImages.append(UIImage(named: "istanbul")!)
        LandMarkImages.append(UIImage(named: "greek")!)
        LandMarkImages.append(UIImage(named: "italy")!)
        LandMarkImages.append(UIImage(named: "kremlin")!)
        LandMarkImages.append(UIImage(named: "tajmahal")!)
        
   
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  LandMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = LandMarkNames[indexPath.row]
        content.image = LandMarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = LandMarkNames[indexPath.row]
        chosenLandMarkImage = LandMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVCViewController
            destinationVC.selectedLandMarkName = chosenLandMarkName
            destinationVC.SelectedLandMarkImage = chosenLandMarkImage
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.LandMarkNames.remove(at: indexPath.row)
            self.LandMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.automatic)
        }
    }
}

