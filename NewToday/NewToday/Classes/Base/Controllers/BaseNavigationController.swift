//
//  BaseNavigationController.swift
//  NewToday
//
//  Created by Andy on 2020/3/3.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 设置全屏返回手势
        guard  let targets = interactivePopGestureRecognizer?.value(forKey: "_targets") as?[AnyObject] else {
            return
        }
        //拿到 action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff515c0dc80>

        let dict = targets[0]
        //拿到action
        let target = dict.value(forKey: "target") as Any
        //通过字典无法拿到action，这里通过Selector方法包装action
        let action = Selector(("handleNavigationTransition:"))

        //拿到target action 创建pan手势并添加到全屏view上
        let gesture = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(gesture)
        
    }

}
