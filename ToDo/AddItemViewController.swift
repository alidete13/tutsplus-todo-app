//
//  AddItemViewController.swift
//  ToDo
//
// This project contains the code you get if you follow the directions in these tutorials:
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
// http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23335
//

import UIKit

protocol AddItemViewControllerDelegate {
    func controller(controller: AddItemViewController, didAddItem: String)
}

class AddItemViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    var delegate: AddItemViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func create(sender: UIButton) {
        let item = self.textField.text
        
        if let delegate = self.delegate {
            delegate.controller(self, didAddItem: item!)
        }
    }

}
