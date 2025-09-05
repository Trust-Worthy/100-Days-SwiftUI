//
//  ViewController.swift
//  project4
//
//  Created by Trust-Worthy on 8/18/25.
//

import UIKit
import WebKit // Webkit framework

// extends from UIViewController and conforms to WKNav
// This viewcontroller class is a uiview contlr (extends) and conforms to weknavdele
// first one extends second conforms to
class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView! // store property for later on
    var progressView: UIProgressView! // allows user to see loading
    var websites = ["apple.com","adidas.com","goshendigitalsecurity.com"]
    
    // loadView technically gets called before viewDidLoad
    override func loadView() {
        
        // create instance of wk class
        webView = WKWebView()
        
        // modify navigation deleage
        // delegation is a programming pattern
        // delegate - one thing acting in place for another
        // delegation solution --> tell wk web view when something happens. When any web navigation happens
        // tell webview what view controller is running
        // when you set any delegate --> must conform to protocols the delegate has
        webView.navigationDelegate = self
        
        // make that view view for view controller
        view = webView
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creating custom title for bar button item instead of a system item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        // back button
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        // forward button
        let forwardButton = UIBarButtonItem(title: "Forward", style: .plain, target: self, action: #selector(goForward))
        
        navigationItem.leftBarButtonItems = [backButton, forwardButton]
        
        // .flexible space creates a flex space
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // reloads the webview in place
        // refresh button --> #selector(webView.reload)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        
        progressView = UIProgressView(progressViewStyle: .bar) // tried the .bar instead of .default
        progressView.sizeToFit() // take up as much space as it needs
        
        let progressButton = UIBarButtonItem(customView: progressView)
        
        // shows the tool bar items
        // toolbarItems come from parent class UIView Controller
        toolbarItems = [progressButton, spacer,refresh] // ui view controller tool bar array
        
        navigationController?.isToolbarHidden = false
        
        // make sure to remove observer when working in complex apps after calling addobserver
        // must implement
        // KVO --> key value observing
        // please tell me when property X of object y gets changed by anyone at anytime
        // 1. add webview as observer of property WekWebView.estimatedProgress on the
        // 4 argws for observer: who observer is, what property to observe, value we want (new), context value
        // #keyPath allows compiler to check if code is correct
        // must implement observe value method
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        // creates new url object
        let url = URL(string: "https://" + websites[0])!
        
        // wk web views don't load url objects or strings
        webView.load(URLRequest(url: url)) // turns url into url request
        // allows users to swipe left or right to go forward backward
        webView.allowsBackForwardNavigationGestures = true
    }
    
    // MARK: - Actions
    
    @objc func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    // @objc becasue of target action system
    //
    @objc func openTapped() {
        
        // creating new alert controller
        // action sheet is created when Open is pressed
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        
        for website in websites {
            
            // action to open one of the websites
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        
        // hides the alert when cancel is tapped
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        // this is used for ipads
        // where to make the action sheet to be anchored
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // ipad code
        
        // show the alert controller
        present(ac, animated: true)
    }
    
    
    // openPage is the handler when the user touches something
    func openPage(action: UIAlertAction) {
        
        // super safe code
        // sets the title of the action
        // passing in "website" on line 83 as the title"
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://" + actionTitle ) else {return}
        
        // when action is selected it will open the page
        webView.load(URLRequest(url: url))
        
        
    }
    
    
    // called when web page has finished loading its page
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // view controllers title
        // making the title of the view contoller the title of the website
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            
            // type cast from double to float
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    // allows me to decide whether I want navigation to happen or not everytime something happens
    // decision Handler could be a "do you want to enter in your password"
    // escaping closure --> can happen at a later time so use @escaping keyword
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping @MainActor (WKNavigationActionPolicy) -> Void) {
        
        
        
        // get the url or the vavigation
        let url = navigationAction.request.url
        
        
        // Ignore about:blank and similar system URLs
        if url?.scheme == "about" {
            decisionHandler(.allow)
            return
        }
        
        // check the host
        // unwrap value of url becasue not all urls have hosts
        if let host = url?.host {
    
            // check all the websites in approved list
            for website in websites {
                
                // if the host is in the website list
                if host.contains(website) || host.contains("www." + website){
                    // allow it to load
                    decisionHandler(.allow)
                    return
                }
            }
        }
        // show alert
        let ac = UIAlertController(title: "This is a dangerous website!!!: \(url?.absoluteString)"  , message: nil, preferredStyle: .alert)
        present(ac,animated: true)
        decisionHandler(.cancel) // disallow loading if the host isn't in the approved website
    }

}

