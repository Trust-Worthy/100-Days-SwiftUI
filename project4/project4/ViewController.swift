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
    var progressView: UIProgressView!
    
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // reloads the webview in place
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit() // take up as much space as it needs
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton, spacer,refresh] // ui view controller tool bar array
        navigationController?.isToolbarHidden = false
        
        // make sure to remove observer when working in complex apps
        // must implement
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url)) // turns url into url request
        webView.allowsBackForwardNavigationGestures = true
    }

    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "404media.co", style: .default, handler: openPage))
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
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

}

