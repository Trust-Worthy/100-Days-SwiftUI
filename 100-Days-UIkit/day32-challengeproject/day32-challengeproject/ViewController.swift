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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptShoppingListItem))
        
        
    }
    
    private func addShoppingListItem(_ item: String) {
        
        shoppingList.insert(item, at:0)
        let indexPath = IndexPath(row: 0, section: 0)
        // helps with animation
        tableView.insertRows(at: [indexPath], with: .automatic)
        
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
    
    // MARK: - Selector Methods
    
    @objc private func promptShoppingListItem() {
        
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submittedItem = UIAlertAction(title: "Add Item",style: .default) {
            [weak self, weak ac] _ in
            
            guard let answer = ac?.textFields?[0].text else {return }
            self?.addShoppingListItem(answer)
        }
        
        ac.addAction(submittedItem)
        present(ac, animated: true)
        
    }
    
    @objc private func clearShoppingList() {
        
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
   


}

