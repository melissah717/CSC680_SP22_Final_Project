//
//  NoteViewController.swift
//  iTinerary
//
//  Created by Melissa Ho on 5/5/22.
//
// Resource: https://www.youtube.com/watch?v=pZVXENscpTM

import Foundation
import UIKit

class NoteViewController: UIViewController{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteText: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteText.text = note
    }
    
}
