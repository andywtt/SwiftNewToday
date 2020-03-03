//
//  BaseController.swift
//  NewToday
//
//  Created by 吴腾通 on 2020/3/2.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit


class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


extension BaseController {
    // 重写 当调用模态视图时，展示全屏
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super .present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
}


