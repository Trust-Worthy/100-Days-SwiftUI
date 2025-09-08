//
//  ViewController.swift
//  Project6
//
//  Created by Trust-Worthy on 9/8/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        // Add labels to view
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
//        let viewsDictionary = ["label1": label1, "label2":label2,"label3":label3,"label4": label4, "label5":label5]
//        
//        // visual format language VFL
//        // horizonal
//        for label in viewsDictionary.keys {
//            // view = main view for main view controller
//            // add Constraints adds the contraints to the view
//            // NS layout constraint converts VFL into actual constraints
//            // H means horizonal. pipe means edge of the view. brackets are edge of the view
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//        }
//        
//        let metrics = ["labelHeight": 88]
//        // verical
//        // - means space --> 10 points by def
//        // no pipe at the end. just leaves white space
//        // == 88 means size must be 88 points
//        // - space at end of screen must be 10 points or greater near end of screen -
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(==labelHeight@999)]-[label2(==label1)]-[label3(==label1)]-[label4(==label1)]-[label5(==label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        
        // create optional label because the first label won't have one above it
        var previous: UILabel?
        
        // about to use the anchor method
        // looping over all the labels --> giving them the same width as main view and height of exactly 88 points
        
        for label in [label1, label2, label3, label4,label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            // set the current label as 10 points below bottom of previous
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                // this is the top label
                // put top label directly against the top anchor for the phone!!!
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            // previous label become the current one
            previous = label
            
        }
    }


}

