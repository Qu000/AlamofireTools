//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by qujiahong on 2018/6/12.
//  Copyright © 2018年 瞿嘉洪. All rights reserved.
/*Alamofire 4.7*/

import UIKit
import Alamofire

//http://httpbin.org 可用于测试各种网络请求，及网络发送
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getRequest()
        
//        postRequest()
        
//        postRequestWithParam()
        
        useNetworkTools()
        
    }

    // MARK: - get
    func getRequest() {
        
        Alamofire.request("http://httpbin.org/get",method: .get).responseJSON { (response) in
            guard let result = response.result.value else{
                print("error=\(String(describing: response.result.error))")
                return
                
            }
            print(result)
            
        }
    }

    // MARK: - post无参
    func postRequest() {
        Alamofire.request("http://httpbin.org/post",method: .post).responseJSON { (response) in
            guard let result = response.result.value else{
                print("error=\(String(describing: response.result.error))")
                return
                
            }
            print(result)
        }
    }
    
    // MARK: - post含参
    func postRequestWithParam() {
        
        let parameters: Parameters = [
            "number": [1,2,3],
            "user": [
                "name": "iOS_July"
            ]
        ]

        Alamofire.request("http://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            guard let result = response.result.value else{
                print("error=\(String(describing: response.result.error))")
                return
                
            }
            print(result)
        }
        
    }
    
    // MARK: - 利用封装的Alamofire工具类
    func useNetworkTools() {
        
        NetworkTools.requestData(.get, URLString: "http://httpbin.org/get") { (result) in
            
            print("get-\(result)")
        }
        
        let parameters: Parameters = [
            "number": [1,2,3],
            "user": [
                "name": "iOS_July"
            ]
        ]
        NetworkTools.requestData(.post, URLString: "http://httpbin.org/post", param: parameters) { (result) in
           
            print("post-\(result)")
        }
    }
}






