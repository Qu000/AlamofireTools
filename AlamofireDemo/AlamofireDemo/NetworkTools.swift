//
//  NetworkTools.swift
//  AlamofireDemo
//
//  Created by qujiahong on 2018/6/13.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}


class NetworkTools {
    
    class func requestData(_ type: MethodType,URLString: String, param: [String : Any]? = nil, finishedCallback : @escaping(_ result: Any) -> ()) {
        //1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        //2.发起网络请求
        Alamofire.request(URLString, method: method , parameters: param).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {
                print("error:\(String(describing: response.result.error))")
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
        
    }
}


/*
 
 
 let method = type == .get ? MethodType.get : MethodType.post
 
 //2.发起网络请求
 if method == .get {
 Alamofire.request(URLString, method: .get, parameters: param).responseJSON { (response) in
 
 //3.获取数据
 guard let result = response.result.value else{
 print("error=\(String(describing: response.result.error))")
 return
 }
 print("get-result=\(result)")
 }
 }
 if method == .post{
 Alamofire.request(URLString, method: .post, parameters: param).responseJSON { (response) in
 guard let result = response.result.value else{
 print("error=\(String(describing: response.result.error))")
 return
 }
 print("post-result=\(result)")
 }
 }
 */

















