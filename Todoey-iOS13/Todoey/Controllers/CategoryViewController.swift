//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Олег Дербин on 15.11.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    var categoryArray: Results<Categories>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
            let newCategory = Categories()
            newCategory.name = textField.text!
            self.saveData(category: newCategory)
        }
        
        alert.addAction(action)
        
        alert.addTextField { field in
            textField = field
            textField.placeholder = "Add new category"
        }
        
        present(alert, animated: true)
        
    }
    
}

//MARK: - Tableview Datasource Methods

extension CategoryViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No category"
        return cell
    }
}

//MARK: - Data manipulations methods

extension CategoryViewController {
    
    func saveData(category: Categories) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Save error \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
        
        categoryArray = realm.objects(Categories.self)
        
        //        let request :NSFetchRequest<Categories> = Categories.fetchRequest()
        //        do {
        //            categoryArray = try context.fetch(request)
        //        } catch {
        //            print("Error load data \(error)")
        //        }
        //        tableView.reloadData()
        //    }
    }
}
    
    //    MARK: - Tableview Delegate Methods
    
        extension CategoryViewController {
    
            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                performSegue(withIdentifier: "goToItems", sender: self)
            }
    
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let destinationVC = segue.destination as! TodoListViewController
    
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
    
                destinationVC.selectedCategory = categoryArray?[indexPath.row]
            }
        }


