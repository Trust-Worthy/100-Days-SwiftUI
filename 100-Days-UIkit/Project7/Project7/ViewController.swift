//
//  ViewController.swift
//  Project7
//
//  Created by Trust-Worthy on 9/9/25.
//

import UIKit

class ViewController: UITableViewController {
    
    // array of custom type
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            // Data can accept any binary data
            if let data: Data = try? Data(contentsOf: url) {
                // Ok to parse data
                
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        
        return cell
    }


}

