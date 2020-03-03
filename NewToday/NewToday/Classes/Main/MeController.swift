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
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { (make) in
            make.height.equalTo(122)
            make.width.equalTo(179)
            make.centerX.equalTo(view)
            make.top.equalTo(kNavigationBarH)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("登录", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setBackgroundImage(UIImage(named: "profile_grid_login"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "profile_grid_login"), for: .highlighted)
        btn.addTarget(self, action: #selector(clickLogin), for: .touchUpInside)
        return btn
    }()
    
    @objc private func clickLogin() {
        self.present(BaseNavigationController(rootViewController: LoginController()), animated: true, completion: nil)
    }

}


extension MeController {
    
    
    
}
