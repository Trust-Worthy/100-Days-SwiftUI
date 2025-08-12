//
//  ViewController.swift
//  storm-viewer
//
//  Created by Trust-Worthy on 8/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fm = FileManager.default
        
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.description.hasPrefix("nssl") {
                // this is a picture to load
                
            }
        }
    }


}

