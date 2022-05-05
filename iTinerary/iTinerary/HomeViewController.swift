//
//  ViewController.swift
//  iTinerary
//
//  Created by Ze Lei on 3/12/22.
//
// Resource:

import UIKit

struct Option {
    let title: String
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var options: [Option] = [
        Option(title: "Map"),
        Option(title: "Checklist"),
        Option(title: "Schedule"),
        Option(title: "Journal"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "iTinerary"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let row = indexPath.row
        let optionItem = options[row]
        cell.textLabel?.text = optionItem.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            performSegue(withIdentifier: "ToMapSegue", sender: indexPath)
        }
        else if (indexPath.row == 1){
            performSegue(withIdentifier: "ToChecklistSegue", sender: indexPath)
        }
        else if (indexPath.row == 2){
            performSegue(withIdentifier: "ToScheduleSegue", sender: indexPath)
        }
        else if (indexPath.row == 3) {
            performSegue(withIdentifier: "ToJournalSegue", sender: indexPath)
        }
    }
}
