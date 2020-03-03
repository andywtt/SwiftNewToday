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
        view.backgroundColor = RGBColor(r: 248, g: 248, b: 248)
        view.addSubview(cancelButton)
        view.addSubview(logoImageView)
        view.addSubview(topTitleLabel)
        
        view.addSubview(chinaMobileLabel)
        view.addSubview(numberLabel)
        view.addSubview(loginButton)
        
        view.addSubview(moreLabel)
        view.addSubview(agreeMobile)
        view.addSubview(otherLabel)
        
        configContraint()
    }
    
    private func configContraint() {
        cancelButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.left.equalTo(5)
            make.top.equalTo(kStatusBarH)
        }
        
        logoImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(55)
            make.centerX.equalTo(view)
            make.top.equalTo(kNavigationBarH+30)
        }
        
        topTitleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.height.equalTo(40)
            make.centerX.equalTo(view)
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
        }
        
        chinaMobileLabel.snp.makeConstraints { (make) in
            make.width.height.centerX.equalTo(topTitleLabel)
            make.top.equalTo(topTitleLabel.snp.bottom).offset(30)
        }
        
        numberLabel.snp.makeConstraints { (make) in
            make.width.height.centerX.equalTo(chinaMobileLabel)
            make.top.equalTo(chinaMobileLabel.snp.bottom)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(44)
            make.centerX.equalTo(view)
            make.top.equalTo(numberLabel.snp.bottom).offset(20)
        }
        
        moreLabel.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.height.equalTo(20)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-100)
        }
        
        agreeMobile.snp.makeConstraints { (make) in
            make.width.height.equalTo(moreLabel)
            make.centerX.equalTo(view)
            make.top.equalTo(moreLabel.snp.bottom).offset(5)
        }
        
        otherLabel.snp.makeConstraints { (make) in
            make.width.height.equalTo(agreeMobile)
            make.centerX.equalTo(view)
            make.top.equalTo(agreeMobile.snp.bottom).offset(5)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private lazy var cancelButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "close_sdk_register"), for: .normal)
        
        btn.addTarget(self, action: #selector(clickCancelButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var logoImageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "shareLogo"))
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
    
    
    
    private lazy var chinaMobileLabel: UILabel = {
        let label = UILabel()
        label.text = "中国移动认证"
        label.font = customFont(font: 13)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "188****0712"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("一键登录", for: .normal)
        btn.titleLabel?.font = customFont(font: 15)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 4
        btn.backgroundColor = RGBColor(r: 236, g: 75, b: 71)
        btn.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var moreLabel: YYLabel = {
        let str1 = "更多登录"
        let point1 = "  ·  "
        let str2 = "隐私设置"
        let point2 = "  ·  "
        let str3 = "遇到问题"
        var attributStr = NSMutableAttributedString(string: "\(str1)\(point1)\(str2)\(point2)\(str3)")
        
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], range: NSRange.init(location: 0, length: str1.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], range: NSRange.init(location: str1.count+point1.count, length: str2.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], range: NSRange.init(location: (str1.count+point1.count)*2, length: str3.count))
        
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], range: NSRange.init(location: str1.count, length: point1.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], range: NSRange.init(location: str1.count+str2.count+point1.count, length: point2.count))
        
        weak var weakSelf = self
        
        attributStr.yy_setTextHighlight(NSRange.init(location: 0, length: str1.count), color: UIColor.darkGray, backgroundColor: nil) { (subView, attstr, rang, frame) in
            print("更多登录")
            weakSelf?.navigationController?.pushViewController(MoreLoginController(), animated: true)
        }
        
        attributStr.yy_setTextHighlight(NSRange.init(location: str1.count+point1.count, length: str2.count), color: UIColor.darkGray, backgroundColor: nil) { (subView, attstr, rang, frame) in
            print("隐私设置")
            
            weakSelf?.navigationController?.pushViewController(PrivacySettingsController(), animated: true)
        }
        
        attributStr.yy_setTextHighlight(NSRange.init(location: (str1.count+point1.count)*2, length: str3.count), color: UIColor.darkGray, backgroundColor: nil) { (subView, attstr, rang, frame) in
            print("遇到问题")
        }
        
        let label = YYLabel()
        label.attributedText = attributStr
        label.font = customFont(font: 13)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var agreeMobile: YYLabel = {
        
        let str1 = "登录即同意"
        let str2 = "《中国移动认证服务条款》"
        
        var attributStr = NSMutableAttributedString(string: "\(str1)\(str2)")
        
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], range: NSRange.init(location: 0, length: str1.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], range: NSRange.init(location: str1.count, length: str2.count))
        
        weak var weakSelf = self
        attributStr.yy_setTextHighlight(NSRange.init(location: str1.count, length: str2.count), color: UIColor.gray, backgroundColor: nil) { (subView, attstr, rang, frame) in
            print("《中国移动认证服务条款》")
            let webvc = WebController()
            webvc.url = "https://www.toutiao.com/privacy_protection/#tt_daymode=1&tt_font=m?tt_from=copy_link&utm_source=copy_link&utm_medium=toutiao_ios&utm_campaign=client_share"
            weakSelf?.navigationController?.pushViewController(webvc, animated: true)
        }
        
        let label = YYLabel()
        label.attributedText = attributStr
        label.font = customFont(font: 13)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var otherLabel: YYLabel = {
        
        let str1 = "以及"
        let str2 = "“用户协议”"
        let str3 = "和"
        let str4 = "“隐私协议”"
        
        var attributStr = NSMutableAttributedString(string: "\(str1)\(str2)\(str3)\(str4)")
        
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], range: NSRange.init(location: 0, length: str1.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], range: NSRange.init(location: str1.count, length: str2.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.lightGray], range: NSRange.init(location: str1.count+str2.count, length: str3.count))
        attributStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], range: NSRange.init(location: str1.count+str2.count+str3.count, length: str4.count))
        
        
        
        weak var weakSelf = self
        attributStr.yy_setTextHighlight(NSRange.init(location: str1.count, length: str2.count), color: UIColor.gray, backgroundColor: nil) { (subView, attstr, rang, frame) in
            print("用户协议")
            let webvc = WebController()
            webvc.url = "https://www.toutiao.com/user_agreement/#tt_daymode=1&tt_font=m?tt_from=copy_link&utm_source=copy_link&utm_medium=toutiao_ios&utm_campaign=client_share"
            weakSelf?.navigationController?.pushViewController(webvc, animated: true)
        }
        attributStr.yy_setTextHighlight(NSRange.init(location: str1.count+str2.count+str3.count, length: str4.count), color: UIColor.gray, backgroundColor: nil) { (subView, attstr, rang, frame) in
            print("隐私协议")
            let webvc = WebController()
            webvc.url = "https://www.toutiao.com/privacy_protection/#tt_daymode=1&tt_font=m?tt_from=copy_link&utm_source=copy_link&utm_medium=toutiao_ios&utm_campaign=client_share"
            weakSelf?.navigationController?.pushViewController(webvc, animated: true)
        }
        
        let label = YYLabel()
        label.attributedText = attributStr
        label.font = customFont(font: 13)
        label.textAlignment = .center
        return label
    }()
    
    @objc private func clickLoginButton() {
        // 登录成功 回到主页，同时tabbar 更新 图标
        
    }
    
    @objc private func clickCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }

}
