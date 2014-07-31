//
//  ProfileViewController.swift
//  trip-planner
//
//  Created by Сергей on 29.07.14.
//  Copyright (c) 2014 tryparse. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var userImage: UIImageView
    @IBOutlet var userName: UILabel
    @IBOutlet var userCities: UILabel
    @IBOutlet var userPlaces: UILabel
    @IBOutlet var infoView: UIView
    @IBOutlet var dateCell: UITableViewCell
    @IBOutlet var sexCell: UITableViewCell
    @IBOutlet var cityCell: UITableViewCell
    @IBOutlet var editCell: UITableViewCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor()
        userImage.layer.cornerRadius = 78
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 0
        infoView.bounds = CGRect(x: infoView.bounds.minX, y: infoView.bounds.minY, width: infoView.bounds.width, height: 269)
    }
    
    override func tableView(tableView: UITableView!, viewForHeaderInSection section: Int) -> UIView! {
        var headerView:UIView = UIView(frame: CGRectMake(0, 0, tableView.bounds.size.width, 30))
        headerView.backgroundColor = UIColor.clearColor()
        return headerView;
    }
}