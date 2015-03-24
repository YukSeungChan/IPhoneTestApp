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
    var avatarUrl: String?
    var blogUrl: String?
    var company: String?
    var email: String?
    var eventsUrl: String?
    var followerCnt: NSNumber?
    var followingCnt: NSNumber?
    var name: String?
    var username: String?
    var url: String?
    
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
        return [
            "id": "id",
            "avatarUrl": "avatar_url",
            "blogUrl": "blog",
            "company": "company",
            "email": "email",
            "eventsUrl": "events_url",
            "followerCnt": "followers",
            "followingCnt": "following",
            "name": "name",
            "username": "login",
            "url": "url"
        ]
    }
}
