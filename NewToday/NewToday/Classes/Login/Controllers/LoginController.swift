//
//  LoginController.swift
//  NewToday
//
//  Created by 吴腾通 on 2020/3/3.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit

class LoginController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(logoImageView)
        
    }
    
    private lazy var logoImageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: ""))
        return img
    }()
    
    private lazy var topTitleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "登录你的头条  精彩永不丢失"
        lab.textAlignment = .center
        lab.textColor = UIColor.darkGray
        lab.font = customFont(font: 15)
        return lab
    }()
    
    private lazy var moreLogin: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("更多登录", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.titleLabel?.font = customFont(font: 13)
        btn.addTarget(self, action: #selector(clickMoreLogin), for: .touchUpInside)
        return btn
    }()
    
    @objc private func clickMoreLogin() {
        
    }

}
