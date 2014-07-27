//
//  MenuVIewController.swift
//  maps_test
//
//  Created by Сергей on 26.07.14.
//  Copyright (c) 2014 tryparse. All rights reserved.
//

import UIKit

var days = 7

class MenuVIewController:  UITableViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
//        self.tableView.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
//        self.tableView.separatorColor = UIColor(white: 0.15, alpha: 0.2)
    }
    
    //TableView methods
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return days + 2
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        switch indexPath.row {
        case 0:
            return getMenuCell("TitleCell", cellText: "Total days: " + String(days))
        case 1:
            return getMenuCell("DaysCell", cellText: "All days")
        default:
            return getMenuCell("DaysCell", cellText: "Day " + String(indexPath.row - 1))
        }
    }
    
    func getMenuCell(cellId: String, cellText:String) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell
        cell.textLabel.text = cellText
        cell.textLabel.textAlignment = NSTextAlignment.Right
        return cell
    }

}
