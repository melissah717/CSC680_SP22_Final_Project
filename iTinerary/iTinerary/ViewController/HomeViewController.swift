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
    
    
    @IBOutlet weak var table: UITableView!
    
    struct ListOptions {
        
        let title: String
        let imageName: String
        let darkImage: String
    }
    
    let data: [ListOptions] = [
        ListOptions(title: "Map", imageName: "Map", darkImage: "mapLogoLight"),
        ListOptions(title: "Checklist", imageName: "Checklist", darkImage: "checklistLogoLight"),
        ListOptions(title: "Schedule", imageName: "Schedule", darkImage: "scheduleLogoLight"),
        ListOptions(title: "Journal", imageName: "Journal", darkImage: "journalLogoLight"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "iTinerary"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listOptions = data [indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.label.text = listOptions.title
        cell.iconImageView.image = UIImage(named: listOptions.imageName)
        
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
