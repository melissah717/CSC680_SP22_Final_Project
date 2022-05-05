//
//  EntryViewController.swift
//  iTinerary
//
//  Created by Melissa Ho on 5/5/22.
//
// resource: https://www.youtube.com/watch?v=pZVXENscpTM

import Foundation
import UIKit

class EntryViewController: UIViewController{
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var note: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !note.text.isEmpty{
            completion?(text, note.text)
        }
    }
    
}
