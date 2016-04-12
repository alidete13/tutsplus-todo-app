//
//  ViewController.swift
//  ToDo
//
// This project contains the code you get if you follow the directions in this tutorial:
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = []
    
    // Table View Data Source
    
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

