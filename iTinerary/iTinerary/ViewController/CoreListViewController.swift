//
//  CoreListViewController.swift
//  iTinerary
//
//  Created by Jimmy Nguyen on 5/2/22.
//
//
// Resource: https://youtu.be/rjHBINtpKA8

import Foundation
import UIKit

class CoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Checklist"
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (didTapAdd))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter New Item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self]_ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self?.createItem(name: text)
        }))
        
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        cell.accessoryType = model.isDone ? .checkmark : .none
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let item = models[indexPath.row]
//        let sheet = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
//
//        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        sheet.addAction(UIAlertAction(title: "Go to Map", style: .default, handler: {
//            _ in
//            self.performSegue(withIdentifier: "ToMapSegue", sender: indexPath)
//        }))
//        sheet.addAction(UIAlertAction(title: "Checkmark", style: .default, handler: {
//            _ in
//            self.markDone(item: item)
//        }))
//        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
//            let alert = UIAlertController(title: "Edit Item", message: "Enter Your Item", preferredStyle: .alert)
//
//            alert.addTextField(configurationHandler: nil)
//            alert.textFields?.first?.text = item.name
//            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self]_ in
//                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
//                    return
//                }
//
//                self?.updateItem(item: item, newName: newName)
//            }))
//
//            self.present(alert, animated: true)
//        }))
//        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
//            self?.deleteItem(item: item)
//        }))
//
//        present(sheet, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            let model = models2[indexPath.row]
//            deleteItem(item: model)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mapViewController = segue.destination as? MapViewController else {
            return
        }
        guard let indexPath = sender as? IndexPath else {
            return
        }
        let address = models[indexPath.row].name
        mapViewController.address = address
    }
    
    // Core Data
    func getAllItems() {
        
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
        catch {
            // Add any errors here
        }
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem (context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    func markDone(item: ToDoListItem){
        item.isDone = !item.isDone
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
}
