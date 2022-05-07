//
//  JournalViewController.swift
//  iTinerary
//
//  Created by Melissa Ho on 5/4/22.
//
// Resource: https://www.youtube.com/watch?v=pZVXENscpTM

import Foundation
import UIKit

class JournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    
    var models: [(title: String, note: String)] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Journal"
    }
    
    @IBAction func didTapNewNote(){
        guard let EntryViewController = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else {
            return
        }
        EntryViewController.title = "New Note"
        EntryViewController.navigationItem.largeTitleDisplayMode = .never
        EntryViewController.completion = {
            noteTitle, note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.label.isHidden = true
            self.tableView.isHidden = false
            
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(EntryViewController, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let NoteViewController = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else {
            return
        }
        let model = models[indexPath.row]
        NoteViewController.navigationItem.largeTitleDisplayMode = .never
        NoteViewController.title = "Note"
        NoteViewController.noteTitle = model.title
        NoteViewController.note = model.note
        navigationController?.pushViewController(NoteViewController, animated: true)
    }
    
    // Core Data
    func getAllItems() {
        
        do {
//            models2 = try context.fetch(ToDoListItem.fetchRequest())
            
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
}
