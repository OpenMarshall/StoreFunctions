//
//  StoreFunc.swift
//  存储函数
//
//  Created by 徐开源 on 16/2/29.
//  Copyright © 2016年 徐开源. All rights reserved.
//

import UIKit

enum StoreType {
    case userDefaults
    case plist
}

class StoreFunc: NSObject {

    
    // MARK: - Store
    
    class func setContentToDevice (content:AnyObject, key:String, type:StoreType) {
        if type == .userDefaults {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(content, forKey: key)
            print("Set - UserDefaults")
        }else if type == .plist {
            let pathPrefix = NSSearchPathForDirectoriesInDomains(
                NSSearchPathDirectory.DocumentDirectory,
                NSSearchPathDomainMask.AllDomainsMask, true).first
            let pathSuffix = "/" + key + ".plist"
            if let path = pathPrefix?.stringByAppendingString(pathSuffix) {
                NSKeyedArchiver.archiveRootObject(content, toFile: path)
                print("Set - Plist")
            }
        }
    }
    
    class func getContentFromDevice (key:String, type:StoreType) -> AnyObject? {
        var returnObject :AnyObject?
        
        if type == .userDefaults {
            let defaults = NSUserDefaults.standardUserDefaults()
            let content = defaults.objectForKey(key)
            returnObject = content
            print("Get - UserDefaults")
        }else if type == .plist {
            let pathPrefix = NSSearchPathForDirectoriesInDomains(
                NSSearchPathDirectory.DocumentDirectory,
                NSSearchPathDomainMask.AllDomainsMask, true).first
            let pathSuffix = "/" + key + ".plist"
            if let path = pathPrefix?.stringByAppendingString(pathSuffix) {
                if let content = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
                    returnObject = content
                    print("Get - Plist")
                }
            }
        }
        
        return returnObject
    }
    
}
