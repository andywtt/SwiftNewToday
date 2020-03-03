//
//  TabBarController.swift
//  NewToday
//
//  Created by 吴腾通 on 2020/3/2.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit
import AVFoundation

class TabBarController: UITabBarController {
    
    var indexFlag = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTabBarTextColorFont()
        addControllers()
        
    }
    
    
    /// 添加子控制器
    func addControllers() {
        addChildControllers(HomeController(), title: "首页", image: "home_tabbar", selectImg: "home_tabbar_press")
        addChildControllers(XiguaController(), title: "西瓜视频", image: "video_tabbar", selectImg: "video_tabbar_press")
        addChildControllers(HotRankController(), title: "热榜", image: "huoshan_tabbar", selectImg: "huoshan_tabbar_press")
        addChildControllers(PlayerController(), title: "放映厅", image: "long_video_tabbar", selectImg: "long_video_tabbar_press")
        addChildControllers(MeController(), title: "未登录", image: "no_login_tabbar", selectImg: "no_login_tabbar_press")
        
        
    }

    
    /// 设置tabbar的UI效果
    /// - Parameters:
    ///   - childController: 子控制器
    ///   - title: 标题
    ///   - image: 未选中时的图片
    ///   - selectImg: 选中时的图片
    private func addChildControllers(_ childController: UIViewController, title: String, image: String, selectImg: String) {
        // itme text
        childController.tabBarItem.title = title
        // normal image
        childController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        // selected image
        childController.tabBarItem.selectedImage = UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal)
        
        // set navigationController
        let childNav = BaseNavigationController()
        childNav.addChild(childController)
        addChild(childNav)
        
    }
    
    /// 配置tabbar的字体颜色与大小
    private func configTabBarTextColorFont() {
        // selected text color
        tabBar.tintColor = RGBColor(r: 245, g: 90, b: 93)
        // normal text color
        tabBar.unselectedItemTintColor = UIColor.darkGray
        // Helvetica-Ligh   Helvetica
        // set font
        let font = UIFont(name: "Helvetica", size: 10)
        UITabBarItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font : font!], for: .selected)
        UITabBarItem.appearance()
        .setTitleTextAttributes([NSAttributedString.Key.font : font!], for: .normal)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            if indexFlag != index {
                //短振动，普通短震，3D Touch 中 Peek 震动反馈
                let soundShort = SystemSoundID(1519)
                //执行震动
                AudioServicesPlaySystemSound(soundShort)
                animationWithIndex(index: index)
            }
        }
    }
    
    /// 缩放动画
    /// - Parameter index: 选中的item 下标
    private func animationWithIndex(index: Int) {
        var arrViews = [UIView]()
        // 遍历拿到 tabbar 的子视图 添加到数组中
        for tabbar in tabBar.subviews {
            if tabbar.isKind(of: NSClassFromString("UITabBarButton")!) {
                for imgV in tabbar.subviews {
                    if imgV.isKind(of: NSClassFromString("UIImageView")!) {
                        arrViews.append(imgV)
                    }
                }
            }
        }
        
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)// 选中动画效果
        pulse.duration = 0.1 // 持续的时间
        pulse.repeatCount = 1 // 持续的次数
//        pulse.autoreverses = true //是否自动复位
        pulse.fromValue = 0.8 // 开始缩小的倍数
        pulse.toValue = 1 // 结束放到的倍数
        arrViews[index].layer.add(pulse, forKey: nil)// 把动画添加到视图
        indexFlag = index
    }
}
