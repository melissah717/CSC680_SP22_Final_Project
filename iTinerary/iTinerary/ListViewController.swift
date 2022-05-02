//
//  ListViewController.swift
//  iTinerary
//
//  Created by Jimmy Nguyen on 4/30/22.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var listTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
}


extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ListViewController: UITableViewDataSource {
    
}

