//
//  MeController.swift
//  NewToday
//
//  Created by 吴腾通 on 2020/3/2.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit

class MeController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登录", for: .normal)
        btn.setBackgroundImage(UIImage(named: "profile_grid_login"), for: .normal)
        btn.addTarget(self, action: #selector(clickLogin), for: .touchUpInside)
        return btn
    }()
    
    @objc private func clickLogin() {
        
    }

}
