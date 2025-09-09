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
        tableView.dataSource = self
        
        let urlString = "https://hackingwithswift.com/samples/petitions-1.json"
        
        
        if let url = URL(string: urlString) {
            // Using URLSession to load data asynchronously
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                // Data can accept any binary data
                if let data = data {
                    print(String(decoding: data, as: UTF8.self))

                    DispatchQueue.main.async {
                        self.parse(json: data)
                    }
                    
                } else {
                    print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                }
                
            }
            task.resume() // start the task
           
           
        }
    }
    
    private func parse(json: Data) {
        // creates a decoding instance
        let decoder = JSONDecoder()
        
        // Petitions.self is what I'm trying to decode the json from
        // convert it's data to petitions object
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            // assign array to petitions list
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
        
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }


}

