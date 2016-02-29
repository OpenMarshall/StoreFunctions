//
//  ViewController.swift
//  存储函数
//
//  Created by 徐开源 on 16/2/29.
//  Copyright © 2016年 徐开源. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    // MARK: - Main
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arr = [1,2,3,4,5]
        StoreFunc.setContentToDevice(arr, key: "testArr", type: .userDefaults)
        
        let ironMan = Hero(name: "Tony Stark")
        StoreFunc.setContentToDevice(ironMan, key: "testHero", type: .plist)
        
        if let result = StoreFunc.getContentFromDevice("testArr", type: .userDefaults) {
            print(result)
        }
        
        if let result = StoreFunc.getContentFromDevice("testHero", type: .plist) as? Hero {
            print(result.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

