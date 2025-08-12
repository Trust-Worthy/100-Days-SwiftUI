//
//  DetailViewController.swift
//  storm-viewer
//
//  Created by Trust-Worthy on 8/12/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // checks and unwraps the optional for the image name
        if let imageToLoad = selectedImage {
            // if imageToLoad does have a value it will select it to display it
            imageView.image = UIImage(named: imageToLoad)
        }
        
        
        
    }
    


}
