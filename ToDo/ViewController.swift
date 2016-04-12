//
//  ViewController.swift
//  ToDo
//
// This project contains the code you get if you follow the directions in these tutorials:
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23335
// http://code.tutsplus.com/tutorials/swift-from-scratch-access-control-and-property-observers--cms-23487
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = []
    var doneItems: [String] = []
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Fetch Item
        let item = self.items[indexPath.row]
        
        // Dequeue Table View Cell
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("RegularOldTableViewCell", forIndexPath: indexPath)
        
        // Configure Table View Cell
        tableViewCell.textLabel?.text = item
        
        if self.doneItems.contains(item) {
            tableViewCell.accessoryType = .Checkmark
        } else {
            tableViewCell.accessoryType = .None
        }
        
        return tableViewCell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = self.items[indexPath.row]
            
            // Update Items
            self.items.removeAtIndex(indexPath.row)
            
            if let index = self.doneItems.indexOf(item) {
                self.doneItems.removeAtIndex(index)
            }
            
            // Update Table View
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        }
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Fetch Item
        let item = self.items[indexPath.row]
        
        // Fetch Table View Cell
        let tableViewCell = tableView.cellForRowAtIndexPath(indexPath)
        
        // Find Index of Item
        let index = self.doneItems.indexOf(item)
        
        if let index = index {
            self.doneItems.removeAtIndex(index)
            tableViewCell?.accessoryType = UITableViewCellAccessoryType.None
            
        } else {
            self.doneItems.append(item)
            tableViewCell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
    }
    
    // AddItemViewControllerDelegate
    
    func controller(controller: AddItemViewController, didAddItem: String) {
        // Update Data Source
        self.items.append(didAddItem)
        
        // Reload Table View
        self.tableView.reloadData()
        
        // Dismiss Add Item View Controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    
    // Prepare for Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItemSegue" {
            let navigationController = segue.destinationViewController as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddItemViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        }
    }
    
    // Usual

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Populate To-Do List with a Few Items
        self.items = ["Buy Milk", "Finish Tutorial", "Play Minecraft"]
        self.doneItems = ["Finish Tutorial"]
        
        // Commented out, because I prefer to do this by adding a prototype cell to the storyboard.
        // Register Class for Cell Reuse
        // self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

