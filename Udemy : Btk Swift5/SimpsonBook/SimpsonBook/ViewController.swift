//
//  ViewController.swift
//  SimpsonBook
//
//  Created by İbrahim Gülmez on 25.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
  var mySimpson = [Simpson]()
    var chosenSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
          
        let homer = Simpson(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "homer")!)
        
        let Bart = Simpson(name: "bart Simpson ", job: "Old Man", image: UIImage(named: "Bart")!)
        let RalphWiggum = Simpson(name: "Ralph Wiggum ", job: "Crazy baby", image: UIImage(named: "Ralph Wiggum")!)
        
        
      
        
        mySimpson.append(homer)
       
        mySimpson.append(Bart)
        mySimpson.append(RalphWiggum)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpson[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpson[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVc" {
            let destination = segue.destination as! detailsVC
            destination.se
        }
    }

}

