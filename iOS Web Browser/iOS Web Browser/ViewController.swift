//
//  ViewController.swift
//  iOS Web Browser
//
//  Created by Huzaifa Saboowala on 3/29/21.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urltextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        urltextField.delegate = self
        webView.navigationDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let urlString:String = "https://www.apple.com"
        
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        urltextField.text = urlString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString:String = urltextField.text!
        
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        textField.resignFirstResponder()
        return true
    }

    @IBAction func onBackButtonPressed(_ sender: Any) {
     
        if webView.canGoBack
        {
            webView.goBack()
        }
        
    }
    
    @IBAction func onForwardButtonPressed(_ sender: Any) {
        if webView.canGoForward
        {
            webView.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        urltextField.text = webView.url?.absoluteString
    }
    
}

