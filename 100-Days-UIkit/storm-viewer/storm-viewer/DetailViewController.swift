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
    var selectedImageIndex: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedImageIndex![0] + 1) of \(selectedImageIndex![1])" // both are optionals so no need to unwrap
        
        
        navigationItem.largeTitleDisplayMode = .never // no big titles on this view controller
        
        
        // checks and unwraps the optional for the image name
        if let imageToLoad = selectedImage {
            // if imageToLoad does have a value it will select it to display it
            imageView.image = UIImage(named: imageToLoad)
        }
        
        
        
    }
    
    // Allow the user to see the image in full screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }

}
