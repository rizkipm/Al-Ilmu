//
//  NamaSifatViewController.swift
//  BBG AL Ilmu
//
//  Created by Rizki Syaputra on 11/4/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class NamaSifatViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var pg: UIProgressView!
    @IBOutlet weak var webView: UIWebView!
    var timeBoll : Bool!
    var timer : Timer!
    
    let urlString = "http://www.catatanmelura.com/"
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        webView.scalesPageToFit = true
        webView.frame = self.view.bounds
        self.webView.loadRequest(NSURLRequest(url:NSURL(string: urlString)! as URL) as URLRequest)
        // Do any additional setup after loading the view.
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        pg.progress = 0.0
        timeBoll = false
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(NamaSifatViewController.timerCallBack), userInfo: nil, repeats: true)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        timeBoll = false
    }
    @objc func  timerCallBack(){
        if timeBoll != nil {
            if pg.progress >= 1{
                pg.isHidden = true
                timer.invalidate()
            }else {
                pg.progress += 0.1
            }
        }else {
            pg.progress += 0.05
            if pg.progress >= 0.95{
                pg.progress = 0.95
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
