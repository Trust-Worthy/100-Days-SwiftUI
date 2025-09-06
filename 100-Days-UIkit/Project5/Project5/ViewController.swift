//
//  ViewController.swift
//  Project5
//
//  Created by Trust-Worthy on 9/6/25.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // getting the path to the txt file
        if let startWordsULR = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            // if the URL exists
            // try? makes it always safe
            if let startWords = try? String(contentsOf: startWordsULR, encoding: .ascii) {
                
                // separate string by line break
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        // isEmpty is quicker than string.count
        if allWords.isEmpty {
            allWords = ["slikworm"]
        }
        
        startGame()
    }
    
    
    
    
    func startGame() {
        
        // sets view controllers title to be a random word in the array
        title = allWords.randomElement()
        
        // removes all values from the usedWords array
        // when a new word comes up it removes any previous guesses
        usedWords.removeAll(keepingCapacity: true)
        
        // property given from UI Table View Controller
        // reloadData --> reloads all data and section from scratch
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // the identifier is the thing that I add on the side panel gui
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        
        // pulling names of words from array
        cell.textLabel?.text = usedWords[indexPath.row]
        
        return cell
    }
}

