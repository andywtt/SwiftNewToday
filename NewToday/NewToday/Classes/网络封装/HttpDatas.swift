//
//  HttpDatas.swift
//  NewToday
//
//  Created by Andy on 2020/3/2.
//  Copyright © 2020 FL SMART. All rights reserved.
//

import UIKit

import Alamofire

private let httpShareIsntance = HttpDatas()

enum MothodType {
    case get
    case post
}

class HttpDatas: NSObject {
    // 单例
    class var shareInstance: HttpDatas {
        return httpShareIsntance
    }
    
}

extension HttpDatas {
    
    /// 网络请求基础函数
    /// - Parameters:
    ///   - type: 数据请求方式 get / post
    ///   - URLString: 请求的数据路径
    ///   - paramaters: 请求的参数
    ///   - finishCallBack: 请求成功后通过这个block返回
    func requestDatas(_ type: MothodType, URLString: String, paramaters: [String: Any]?, finishCallBack: @escaping (_ response: Any) -> ()) {
        // 获取请求类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        AF.request(URLString, method: method, parameters: paramaters, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (resppnseJson) in
            
            // 判断是否请求成功
            switch resppnseJson.result {
            case .success(let value):
                finishCallBack(value)
            case .failure(let fail):
                print(fail)
                finishCallBack(fail)
            }
            
            
            
        }
        
        
    }
}
