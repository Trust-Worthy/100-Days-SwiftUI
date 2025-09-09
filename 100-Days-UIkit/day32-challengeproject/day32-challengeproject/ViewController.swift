//
//  ViewController.swift
//  day32-challengeproject
//
//  Created by Trust-Worthy on 9/9/25.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearShoppingList))
        
        
        
    }
    
    @objc private func clearShoppingList


}

