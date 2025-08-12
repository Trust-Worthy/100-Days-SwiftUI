//
//  ViewController.swift
//  guess-the-flag-uikit-proj
//
//  Created by Trust-Worthy on 8/12/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        countries += ["estonia","france","germany","ireland","monaco","nigeria","poland","russia","spain","uk","us"]
        
        // Make it easier to see the white in the flags by setting a border
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 2
        
        // convert from ui color to cg color so the ca layer
        // of the border can read / understand it
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
        
    }
    
    func askQuestion(action: UIAlertAction!) {
        
        countries.shuffle() // mix up the flags and randomize them
        
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = countries[correctAnswer].uppercased()
    }
    
    // IB = "interface builder"
    // all 3 buttons are calling the same function
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        // use action to choose option
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        // present our ui alert controller ac
        present(ac, animated: true)
    }
    
    

}

