//
//  ViewController.swift
//  day32-challengeproject
//
//  Created by Trust-Worthy on 9/9/25.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearShoppingList))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addShoppingListItem))
        
        
    }
    
    // MARK: - Table View Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    @objc private func addShoppingListItem() {
        
        
        
    }
    
    @objc private func clearShoppingList() {
        
    }
    
   


}

