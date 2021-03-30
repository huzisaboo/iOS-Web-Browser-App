//
//  ViewController.swift
//  iOS Web Browser
//
//  Created by Huzaifa Saboowala on 3/29/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url:URL = URL(string: "https://www.apple.com")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
    }
    
    

}

