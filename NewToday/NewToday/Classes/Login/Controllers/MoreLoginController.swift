//
//  MoreLoginController.swift
//  NewToday
//
//  Created by 吴腾通 on 2020/3/3.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit

class MoreLoginController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = RGBColor(r: 248, g: 248, b: 248)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    

}
