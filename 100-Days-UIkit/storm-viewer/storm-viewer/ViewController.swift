//
//  ViewController.swift
//  storm-viewer
//
//  Created by Trust-Worthy on 8/12/25.
//

import UIKit

class ViewController: UIViewController {
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


}

