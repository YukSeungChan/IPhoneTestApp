//
//  UserRequests.swift
//  TestApp
//
//  Created by YukSeungChan on 2015. 3. 25..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import Foundation

class UserRequest: BaseHttpRequest {
    
    class var sharedInstance: UserRequest {
        struct Static {
            static var instance: UserRequest?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = UserRequest()
        }
        
        return Static.instance!
    }
    
    func getUserInfo(let username: String, success: (User!) -> (), failure: (AnyObject?) -> ()) {
        self.getRequestWithConvertToModel("https://api.github.com/users/\(username)",
            parameters: nil,
            success: { (user: User?) in
                success(user)
            },
            failure: { (error: AnyObject?) in
                failure(error)
            },
            User.self
        )
    }
    func getSearchedUserList(let searchString: String, success: ([User]!) -> (), failure: (AnyObject?) -> ()) {
        self.getRequestWithConvertToModelList("https://api.github.com/search/users?q=\(searchString)",
            parameters: nil,
            success: { (users: [User]?) in
                success(users)
            },
            failure: { (error: AnyObject?) in
                failure(error)
            },
            User.self
        )
    }
    
}
