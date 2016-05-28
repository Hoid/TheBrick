//
//  DefaultPDFViewController.swift
//  TheBrick
//
//  Created by Monica Steed on 5/27/16.
//  Copyright © 2016 Monica Steed. All rights reserved.
//

import UIKit

class DefaultPDFViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let landscapeLeft = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(landscapeLeft, forKey: "orientation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    convenience init(pageNumber: Int) {
        self.init()
        
        var webView: UIWebView
        if let pdfURL = NSBundle.mainBundle().URLForResource("selection", withExtension: "pdf", subdirectory: ".", localization: nil), data = NSData(contentsOfURL: pdfURL), baseURL = pdfURL.URLByDeletingLastPathComponent  {
            webView = UIWebView(frame: CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height))
            webView.loadData(data, MIMEType: "application/pdf", textEncodingName:"", baseURL: baseURL)
        } else {
            webView = UIWebView()
            print("A problem occurred while loading the PDF")
        }
        self.view.addSubview(webView)
    }
    
}
