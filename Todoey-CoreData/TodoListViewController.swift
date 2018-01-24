//
//  ViewController.swift
//  Todoey-CoreData
//
//  Created by Roy on 24/01/2018.
//  Copyright © 2018 Roy Espinoza. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: TableView Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = self.itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK: TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected: \(self.itemArray[indexPath.row])")
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell!.accessoryType = .checkmark
        } else {
            cell!.accessoryType = .none
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Add new item section
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        var textfield : UITextField?
        
        alert.addTextField { (alertTextField) in
            textfield = alertTextField
            alertTextField.placeholder = "Create new item"
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //
            let newItem = textfield!.text!
            if newItem.isEmpty != true {
                self.itemArray.append(newItem)
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}

