//
//  BaseNavigationController.swift
//  NewToday
//
//  Created by Andy on 2020/3/3.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 设置全屏返回手势
//        guard  let targets = interactivePopGestureRecognizer?.value(forKey: "_targets") as?[AnyObject] else {
//            return
//        }
//        //拿到 action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff515c0dc80>
//
//        let dict = targets[0]
//        //拿到action
//        let target = dict.value(forKey: "target") as Any
//        //通过字典无法拿到action，这里通过Selector方法包装action
//        let action = Selector(("handleNavigationTransition:"))
//
//        //拿到target action 创建pan手势并添加到全屏view上
//        let gesture = UIPanGestureRecognizer(target: target, action: action)
//        view.addGestureRecognizer(gesture)
        
        //写代码的时候Xcode没有提示这两个属性，但确实是可以设置的
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "lefterbackicon_titlebar")
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "lefterbackicon_titlebar")
        
        navigationController?.navigationBar
        // 系统坑，当app采用系统默认的侧滑手势返回上一层控制器，在根控制器侧滑时，再任意点击push新的控制器，页面卡死
        // 解决方案：当为根控制器时，取消侧滑手势
        
        self.delegate = self
        weak var weakSelf = self
        if self.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = weakSelf
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if navigationController.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) {
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
        }
        
        if navigationController.viewControllers.count == 1 {
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
            navigationController.interactivePopGestureRecognizer?.delegate = nil
        }
    }

}
