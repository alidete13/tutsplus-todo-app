//
//  ViewController.swift
//  ToDo
//
// This project contains the code you get if you follow the directions in these tutorials:
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23335
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = []
    
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
        
        return tableViewCell
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
        
        // Commented out, because I prefer to do this by adding a prototype cell to the storyboard.
        // Register Class for Cell Reuse
        // self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

