//
//  ViewController.swift
//  NewToday
//
//  Created by Andy on 2020/3/2.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = RGBColor(r: 222, g: 10, b: 10)
        let dic = ["token":"f2e0c88f-7d32-3464-9cc5"]
        HttpDatas.shareInstance.requestDatas(.get, URLString: "http://101.132.114.122:8099/message/collect_list", paramaters: dic) { (response) in
            let jsonData = JSON(response)
            print("jsonData = \(jsonData)")
            
        }
        
    }


}

