//
//  ViewController.swift
//  storm-viewer
//
//  Created by Trust-Worthy on 8/12/25.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fm = FileManager.default // built in system type for working with files
        
        let path = Bundle.main.resourcePath! // sets resource path
        // bundle --> directory containing code for app
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                // append the file name to the list
                pictures.append(item)
                
            }
        }
        
        print(pictures)
    }
    
    // Create then number of cells there are for the number of entries in the pictures array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // specify what each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) // the identifier is really important. has to be marked in the story board too
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    // MARK: Key function for using multiple screen
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // if the user selects a specific cell
        // cast is to a detail view controller using the "Detail" identifier
        // use the selectedImage property and set it using the pictures array
        // push the new view controller to the nav controller
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

