//
//  FiltersTableViewController.swift
//  Yelp
//
//  Created by Rajesh Kolla on 7/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersTableViewControllerDelegate {
    optional func filtersTableViewController(filtersTableViewController: FiltersTableViewController, didUpdateFilters filters: [String:AnyObject])
}


class FiltersTableViewController: UITableViewController {

    var distances: [Int] = [1609,3218,4828,6437,8046]
    var categories: [String] = ["newamerican","indpak","mexican","chinese","thai"]
    
    var sortBy: [Int] = [0,1,2]
    var findDeals: Bool = false
    
    var selectedSortBy: Int = 0
    var selectedDistance: Int = 0
    var selectedCategories: [String] = []
    
    weak var delegate: FiltersTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func onSortByValueChanged(sender: AnyObject) {
        
        selectedSortBy = sortBy[(sender as! UISegmentedControl).selectedSegmentIndex]
        
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onSearch(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        var filters = [String: AnyObject]()
        
        filters["sortby"] = selectedSortBy
        filters["distance"] = selectedDistance
        filters["deals"] = findDeals
        filters["categories"] = selectedCategories
        
        delegate?.filtersTableViewController?(self, didUpdateFilters: filters)
        
    }
    
    
    @IBAction func onRadiusChanged(sender: AnyObject) {
        
        selectedDistance = distances[(sender as! UISegmentedControl).selectedSegmentIndex]
        
    }
    
    @IBAction func findDeals(sender: AnyObject) {
        
        self.findDeals = (sender as! UISwitch).on
        
    }
    
    @IBAction func onCategorySelection(sender: AnyObject) {
 
        let s = sender as! UISwitch
        selectedCategories.append(categories[s.tag])

    }
    
    

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
