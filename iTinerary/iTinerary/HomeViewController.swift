//
//  ViewController.swift
//  iTinerary
//
//  Created by Ze Lei on 3/12/22.

import UIKit

struct Option {
    let title: String
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var options: [Option] = [
    Option(title: "Maps"),
    Option(title: "Schedules"),
    Option(title: "Notes"),
    Option(title: "Reviews"),
    Option(title: "Awards")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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

}

