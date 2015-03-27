//
//  BaseRequests.swift
//  TestApp
//
//  Created by Ium on 2015. 3. 27..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import Foundation

class BaseHttpRequest {
    
    let requestManager = AFHTTPRequestOperationManager()
    
    func getRequest(
        let url: String,
        let parameters: [String: AnyObject]?,
        let success: (AnyObject!) -> (),
        let failure: (AnyObject!) -> ())
    {
        self.requestManager.GET(url,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                success(responseObject)
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                failure(error)
            }
        )
    }
    
    func getRequestWithConvertToModel<T: MTLModel>(
        let url: String,
        let parameters: [String: AnyObject]?,
        let success: (T?) -> (),
        let failure: (AnyObject?) -> (),
        T.Type)
    {
        self.getRequest(url, parameters: parameters,
            success: { (responseObject: AnyObject!) in
                let objects = MTLJSONAdapter.modelOfClass(T.self, fromJSONDictionary: responseObject!)
                if (objects.model != nil) {
                    success(objects.model)
                } else {
                    failure(objects.error)
                }
            },
            failure: { (error: AnyObject!) in
                failure(error)
            }
        )
    }
    
    func getRequestWithConvertToModelList<T: MTLModel>(
        let url: String,
        let parameters: [String: AnyObject]?,
        let success: ([T]?) -> (),
        let failure: (AnyObject?) -> (),
        T.Type)
    {
        self.getRequest(url, parameters: parameters,
            success: { (responseObject: AnyObject!) in
                var fromJSONDictionary = responseObject as? Dictionary<String, AnyObject>
                var items = fromJSONDictionary!["items"] as? [AnyObject]
                let objects = MTLJSONAdapter.modelsOfClass(T.self, fromJSONArray: items)
                if (objects.models != nil) {
                    success(objects.models)
                } else {
                    failure(objects.error)
                }
            },
            failure: { (error: AnyObject!) in
                failure(error)
            }
        )
    }
}
