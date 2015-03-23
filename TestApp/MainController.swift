//
//  ViewController.swift
//  TestApp
//
//  Created by YukSeungChan on 2015. 3. 22..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let requestManager = AFHTTPRequestOperationManager()
        requestManager.GET("https://api.github.com/users/YukSeungChan",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                let user = MTLJSONAdapter.modelOfClass(User.self, fromJSONDictionary: responseObject!)
                println("JSON:  \(user)")
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: \(error.localizedDescription)")
            }
        )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

