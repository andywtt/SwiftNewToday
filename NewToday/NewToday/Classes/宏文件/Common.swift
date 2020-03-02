//
//  Common.swift
//  NewToday
//
//  Created by Andy on 2020/3/2.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit


/// 屏幕宽度
let kScreenW = UIScreen.main.bounds.width

/// 屏幕高度
let kScreenH = UIScreen.main.bounds.height

/// 主窗口
let KeyWindow = UIApplication.shared.keyWindow

/// 是否为iPhone
let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

/// 是否为刘海屏
let kIsIphoneX = Bool(kScreenW >= 375.0 && kScreenH >= 812.0 && kIsIphone)

/// 导航栏高度
let kNavigationBarH = CGFloat(kIsIphoneX ? 88 : 64)

/// 状态栏高度
let kStatusBarH = CGFloat(kIsIphoneX ? 44 : 20)

/// 底部标签栏高度
let kTabbarH = CGFloat(kIsIphoneX ? (49+34) : 39)

/// 颜色值
/// - Parameters:
///   - r: 红色 0 - 255
///   - g: 绿色 0 - 255
///   - b: 蓝色 0 - 255
func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

/// 自定义字体，根据手机大小自动适配字体大小
/// - Parameter font: 字体大小
func customFont(font: CGFloat) -> UIFont {
    // 刘海屏
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font)
    }
    
    // 5.5
    guard kScreenH == 736 else {
        return UIFont.systemFont(ofSize: font-2)
    }
    // 4.7
    guard kScreenH >= 736 else {
        return UIFont.systemFont(ofSize: font-4)
    }
    return UIFont.systemFont(ofSize: font)
}







