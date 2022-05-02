//
//  TaskViewController.swift
//  iTinerary
//
//  Created by Samantha Saxton-Getty on 5/2/22.
//
//  Reference: https://www.youtube.com/watch?v=U-Y9HJzNhQ0&t=346s&ab_channel=iOSAcademy

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    // TO DO: Implement deletion of tasks
    @objc func deleteTask() {
        
//        let newCount = count - 1
//
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
    }
}
