//
//  WebController.swift
//  NewToday
//
//  Created by Andy on 2020/3/3.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit
import WebKit

class WebController: BaseController {
    
    public var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = false
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { (make) in
            make.width.height.equalTo(view)
            make.center.equalTo(view)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        webView.loadRequest(URLRequest(url: URL(string: url ?? "")!))
        webView.load(URLRequest(url: URL(string: url ?? "")!))

    }
    
    private lazy var webView: WKWebView = {
        let web = WKWebView()
        return web
    }()
}

extension WebController {
    
}
