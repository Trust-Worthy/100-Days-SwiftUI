//
//  ViewController.swift
//  project4
//
//  Created by Trust-Worthy on 8/18/25.
//

import UIKit
import WebKit

// extends from UIViewController and conforms to WKNav
class ViewController: UIViewController, WKNavigationDelegate{
    var webView: WKWebView!
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url)) // turns url into url request
        webView.allowsBackForwardNavigationGestures = true
    }

    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // ipad code
        
        present(ac, animated: true)
    }
    
    // openPage is the handler when the user touches something
    func openPage(action: UIAlertAction) {
        
        // super safe code
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://" + actionTitle ) else {return} // double force unwrap
        
        webView.load(URLRequest(url: url))
        
        
    }
    
    // called when web page has finished loading its page
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // view controllers title
        title = webView.title
    }

}

