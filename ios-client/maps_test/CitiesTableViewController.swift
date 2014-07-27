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
}

var cities = [City]()
var potentialCities = [String]()
var searchResults = [String]()

class CitiesTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet var searchBar: UISearchBar
    @IBOutlet var citiesTableView: UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
//        self.navigationItem.titleView = UISearchBar()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        cities.append(City(name: "Moscow", days: 3))
        cities.append(City(name: "New York", days: 7))
        potentialCities.append("Moscow")
        potentialCities.append("New York")
        potentialCities.append("Newcastle")
        potentialCities.append("Barselona")
        searchResults = potentialCities
    }
    
    //Logic methods
    func addNewCity(name: String, days: Int){
        cities.append(City(name: name, days: days))
        citiesTableView.reloadData()
    }
    
    //Keyboard
    override func viewWillAppear(animated: Bool) {
        citiesTableView.reloadData()
        self.navigationController.navigationBar.hidden = false;
    }
    
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
            return cities.count
        }
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        return (tableView == self.searchDisplayController.searchResultsTableView) ? getCommonCell("StaticCell", cellText: searchResults[indexPath.row], detailedСellText: "") : getCommonCell("Cell", cellText: cities[indexPath.row].name, detailedСellText: String(cities[indexPath.row].days) + " days")
    }
        
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if tableView == self.searchDisplayController.searchResultsTableView {
            addNewCity(tableView.cellForRowAtIndexPath(indexPath).textLabel.text, days: 7)
            self.searchDisplayController.setActive(false, animated:true)
        }
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        //delete cell
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            cities.removeAtIndex(indexPath.row)
            citiesTableView.reloadData()
        }
    }
    
    func getCommonCell(cellId: NSString, cellText:NSString, detailedСellText:NSString) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as UITableViewCell
        cell.textLabel.text = cellText
        cell.detailTextLabel.text  = detailedСellText
        return cell
    }
    
}
