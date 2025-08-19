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
        
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url)) // turns url into url request
        webView.allowsBackForwardNavigationGestures = true
    }


}

