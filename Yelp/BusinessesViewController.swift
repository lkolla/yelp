//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Modified by Rajesh Kolla on 7/24/16
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FiltersTableViewControllerDelegate {

    var businesses: [Business]!
    
    @IBOutlet weak var businessTableView: UITableView!
    
    var searchBar: UISearchBar!
    
    var searchQuestion: String = "restaurants"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Following to initialize table view
        businessTableView.delegate = self
        businessTableView.dataSource = self
        businessTableView.rowHeight = UITableViewAutomaticDimension
        businessTableView.estimatedRowHeight = 120
        
        //Following to setup search bar
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.businessTableView.reloadData()
        
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(self.businesses != nil){
            return self.businesses.count
        }else{
            return 0
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessCell
        
        cell.business = self.businesses[indexPath.row]
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let navigationViewController = segue.destinationViewController as! UINavigationController
        
        let filtersTableViewController = navigationViewController.topViewController as! FiltersTableViewController
        
        filtersTableViewController.delegate = self
        
    }
    
    func filtersTableViewController(filtersTableViewController: FiltersTableViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        
        Business.searchWithTerm(self.searchQuestion,
                                sort: filters["sortby"] as? YelpSortMode,
                                categories: filters["categories"] as? [String],
                                deals: filters["deals"] as? Bool,
                                radius: filters["distance"] as? Int){
                                (businesses: [Business]!, error: NSError!) -> Void in
                                    
                                    self.businesses = businesses
                                    self.businessTableView.reloadData()
                                    
                                }
        
        
    }
    

}

// SearchBar methods
extension BusinessesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {

        searchBar.resignFirstResponder()
        Business.searchWithTerm(searchBar.text!, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.businessTableView.reloadData()
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
    }
}
