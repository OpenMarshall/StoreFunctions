//
//  Hero.swift
//  存储函数
//
//  Created by 徐开源 on 16/2/29.
//  Copyright © 2016年 徐开源. All rights reserved.
//

import UIKit

class Hero: NSObject {
    
    var name:String
    
    init(name:String) {
        self.name = name
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(name, forKey: "name")
    }
    
    init(coder aDecoder: NSCoder!) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
    }
}
