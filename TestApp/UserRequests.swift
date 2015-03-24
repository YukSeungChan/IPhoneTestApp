//
//  UserRequests.swift
//  TestApp
//
//  Created by YukSeungChan on 2015. 3. 25..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import Foundation


struct UserRequests
{
    static let requestManager = AFHTTPRequestOperationManager()
    static func getUserInfo(let username: String, success: (User?) -> ())
    {
        requestManager.GET("https://api.github.com/users/YukSeungChan",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                let objects = MTLJSONAdapter.modelOfClass(User.self, fromJSONDictionary: responseObject!)
                let user = objects.model
                success(user)
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: \(error.localizedDescription)")
                
            }
        )
    }
}
