//
//  User.swift
//  TestApp
//
//  Created by YukSeungChan on 2015. 3. 22..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import Foundation

class User : MTLModel, MTLJSONSerializing
{
    var id: NSNumber?
    
    override init() {
        super.init()
    }
    
    required init(coder: NSCoder!) {
        super.init(coder: coder)
    }
    
    override init(dictionary dictionaryValue: [NSObject : AnyObject]!, error: NSErrorPointer) {
        super.init(dictionary: dictionaryValue, error: error)
    }
    
    class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]!
    {
        return ["id": "id"]
    }
}
