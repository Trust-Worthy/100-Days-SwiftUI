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
        
        // when detail view controller is visible , this takes effect
        // .action ==> that little image that shows to share
        // target param: this share function will appear on the detail view controller
        // action param: when tapped / selected call shareTapped
        // #selector ==> tells swift compiler that shareTapped will exist
        // UIbarButton item is part of the underlayer of UIKit that's written in objective C
        // obj c can't see it's method calls
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
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
    
    // tell swift for this one method please compile it for swift use but also make it visible to objective C code
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        // what to share when shareTapped is called
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        
        // this thing was shown from the right bar button item
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }

}
