//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("journalCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedController.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        
        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entry = EntryController.sharedController.entries[indexPath.row]
            EntryController.sharedController.removeEntry(entry)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toViewEntry" {
            if let entryListVC = segue.destinationViewController as? EntryDetailViewController {
                if let entryCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(entryCell) {
                        entryListVC.entry = EntryController.sharedController.entries[indexPath.row]
                    }
                }
            }
        }
    }
}
