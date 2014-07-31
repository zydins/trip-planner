//
//  CitiesTableViewController.swift
//  maps_test
//
//  Created by Georgii on 7/16/14.
//  Copyright (c) 2014 tryparse. All rights reserved.
//

import UIKit

struct City {
    var name = "City"
    var days = 3
    var lat = 0.0
    var lon = 0.0
}

var userCities = [City]()
var potentialCities = [String]()
var searchResults = [String]()
var allCities = ["Moscow":City(name: "Moscow", days: 7, lat: 55.751463, lon:37.618624),
                 "New York":City(name: "New York", days: 7, lat: 40.730966, lon:-73.985925),
                 "Newcastle":City(name: "Newcastle", days: 7, lat: 54.977827, lon:-1.612914),
                 "Barcelona":City(name: "Barcelona", days: 7, lat: 41.387915, lon:2.16992)]


class CitiesTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet var searchBar: UISearchBar
    @IBOutlet var citiesTableView: UITableView
//    var navBarHairlineImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController.navigationBar.barTintColor = UIColor(red:0, green:0.8, blue:1, alpha:0.0)
        self.navigationController.navigationBar.translucent = true
        self.navigationItem.leftBarButtonItem.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem.tintColor = UIColor.whiteColor()
        self.navigationController.navigationBar.barStyle = UIBarStyle.BlackTranslucent
//        navBarHairlineImageView = self.findHairlineImageViewUnder(self.navigationController.navigationBar)
        userCities.append(City(name: "Moscow", days: 3, lat: 55.751463, lon:37.618624))
        userCities.append(City(name: "New York", days: 7, lat: 40.730966, lon:-73.985925))
        potentialCities = Array(allCities.keys)
        searchResults = potentialCities
    }
    
    //Logic methods
    func addNewCity(city:City){
        userCities.append(city)
        citiesTableView.reloadData()
    }
    
    //Keyboard
    override func viewWillAppear(animated: Bool) {
        citiesTableView.reloadData()
        self.navigationController.navigationBar.hidden = false;
        self.navigationController.navigationBar.barStyle = UIBarStyle.BlackTranslucent
//        navBarHairlineImageView.hidden = true
    }
    
    
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        navBarHairlineImageView.hidden = false;
//    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    //System methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //SearchBar methods
    func searchBar(searchBar: UISearchBar!, shouldChangeTextInRange range: NSRange, replacementText text: String!) -> Bool {
        // called before text changes
        return true
    }
    
    func searchBar(searchBar: UISearchBar!, textDidChange searchText: String!) {
        // called when text changes (including clear)
        println("ch-ch-ch-changes")
    }
    
    func searchDisplayControllerWillBeginSearch(controller: UISearchDisplayController!) {
        println("will start")
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        // Tells the table data source to reload when text changes
        self.filterContentForSearchText (searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        // Tells the table data source to reload when scope bar selection changes
        return true
    }
    
    func filterContentForSearchText (searchText: String) {
        searchResults = potentialCities.filter{ ($0 as NSString).localizedCaseInsensitiveContainsString("\(searchText)") }
    }
    
    //TableView methods
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController.searchResultsTableView {
            return searchResults.count
        } else {
            return userCities.count
        }
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        return (tableView == self.searchDisplayController.searchResultsTableView) ? getCommonCell("StaticCell", cellText: searchResults[indexPath.row], detailedСellText: "") : getCommonCell("Cell", cellText: userCities[indexPath.row].name, detailedСellText: String(userCities[indexPath.row].days) + " days")
    }
        
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        //tap on cell
        if tableView == self.searchDisplayController.searchResultsTableView {
            addNewCity(allCities[tableView.cellForRowAtIndexPath(indexPath).textLabel.text]!)
            self.searchDisplayController.setActive(false, animated:true)
        } else {
            MapViewController.setDays(Int32(userCities[indexPath.row].days))
            MapViewController.setLat(userCities[indexPath.row].lat)
            MapViewController.setLon(userCities[indexPath.row].lon)
        }
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        //delete cell
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            userCities.removeAtIndex(indexPath.row)
            citiesTableView.reloadData()
        }
    }
    
    func getCommonCell(cellId: NSString, cellText:NSString, detailedСellText:NSString) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell
        cell.textLabel.text = cellText
        cell.detailTextLabel.text  = detailedСellText
        return cell
    }
    
//    func findHairlineImageViewUnder(view:UIView) -> UIImageView! {
//        if (view.isKindOfClass(object_getClass(view)) && view.bounds.size.height <= 1.0) {
//            return view as UIImageView
//        }
//        for subview in view.subviews {
//            var imageView = self.findHairlineImageViewUnder(subview as UIView)
//            if (imageView) {
//                return imageView
//            }
//        }
//        return nil
//    }
}
