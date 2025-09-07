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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
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
    
    // gets called from right bar button item
    @objc func promptForAnswer() {
        
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        
        // where user will type in answer
        // adds new text box to the alert controller
        ac.addTextField()
        
        
        // using trailing closure syntax
        // both the alert controller and view controller are referenced in the closure
        // don't want to capture the view ctrlr and ac strongly
        // stops strong reference cycle
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in // specified input into closure
            
            // reference to ac may not exist in the future
            // get the first text field (where user put in answer)
            guard let answer = ac?.textFields?[0].text else {return}
            
            // reference to self might not exist in the future
            self?.submit(answer)
        }
        
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
    func submit(_ answer: String) {
        
        // make answer lowercase to normalize
        let lowerAnswer = answer.lowercased()
        
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    
                    // insert answer in used words array at position 0 so
                    // it's at the top of the table view
                    usedWords.insert(answer, at: 0)
                    
                    // insert a row at that position (top of table view)
                    let indexPath = IndexPath(row: 0, section: 0)
                    
                    // this helps with animations
                    // adding one cell is easier than adding a bunch of cells
                    tableView.insertRows(at: [indexPath], with: .automatic)
                }
            }
        }
    }
    
    
    func isPossible(word: String) -> Bool {
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return true
    }
    
    func isReal(word: String) -> Bool {
        return true
    }
 
    
}

