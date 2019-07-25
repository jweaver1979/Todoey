//
//  ViewController.swift
//  Todoey
//
//  Created by Jerome weaver on 7/25/19.
//  Copyright © 2019 Jerome weaver. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var basketballArray = ["Basketball Scouting", "Basketball Reports", "Basketball Events"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketballArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = basketballArray[indexPath.row]
        
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(basketballArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK - Add New Items
  
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alrert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
         self.basketballArray.append(textField.text!)
            
         self.tableView.reloadData()
            
            
        }
        alrert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new iteam "
            textField = alertTextField
        }
        alrert.addAction(action)
        present(alrert, animated: true, completion: nil)
        
        
    }
    
}
