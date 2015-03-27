//
//  ViewController.swift
//  TestApp
//
//  Created by YukSeungChan on 2015. 3. 22..
//  Copyright (c) 2015년 Loup. All rights reserved.
//

import UIKit

class MainController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var avatarImageView : UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Get the corresponding candy from our candies array
        let user = self.users[indexPath.row]
        
        if let username = user.username {
            cell.textLabel!.text = username
        }
        if let avatarData = user.avatarData {
            cell.imageView?.image = UIImage(data: avatarData)
        }
        cell.preservesSuperviewLayoutMargins = false
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search(searchBar.text)
        searchBar.resignFirstResponder()
    }
    
    private func search(searchString: String) {
        IndicatorUtil.sharedInstance.showActivityIndicator(self.view)
        UserRequest.sharedInstance.getSearchedUserList(searchString,
            success: { (users: [User]!) in
                self.users = users
                self.tableView.reloadData()
                IndicatorUtil.sharedInstance.hideActivityIndicator(self.view)
            },
            failure: { (error: AnyObject?) in
                println(error)
                IndicatorUtil.sharedInstance.hideActivityIndicator(self.view)
            }
        )
    }
    
}

