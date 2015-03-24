//
//  ViewController.swift
//  TestApp
//
//  Created by YukSeungChan on 2015. 3. 22..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var avatarImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UserRequests.getUserInfo("YukSeungChan", success: { (user: User?) in
            self.nameLabel!.text = user?.username
            self.emailLabel!.text = user?.email
            if let avatarUrl = user?.avatarUrl
            {
                let url = NSURL(string: avatarUrl)
                let data = NSData(contentsOfURL: url!)
                self.avatarImageView.image = UIImage(data: data!)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

