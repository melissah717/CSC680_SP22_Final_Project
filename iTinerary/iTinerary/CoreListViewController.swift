//
//  CoreListViewController.swift
//  iTinerary
//
//  Created by Jimmy Nguyen on 5/2/22.
//

import Foundation
import UIKit

class ViewCOntroller: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getAllItems() {
        let items = context.fetch(ToDoListItem.fetchRequest())
    } catch {
        // put errors here
    }
    
    func createItem(name: String) {
        context.delete(item)
    }
    
    func deleteItem(item: ToDoListItem) {
        
    }
    
//    func updateItem(item: ToDoListItem) {
//
//    }
}
