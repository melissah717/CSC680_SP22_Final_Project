//
//  EntryViewController.swift
//  iTinerary
//
//  Created by Ze Lei on 5/5/22.
//
//  Resource: https://www.youtube.com/watch?v=pZVXENscpTM

import Foundation
import UIKit

class EntryViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var note: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = "Your title..."
        titleField.textColor = UIColor.placeholderText
        titleField.delegate = self
        note.text = "Your description..."
        note.textColor = UIColor.placeholderText
        note.delegate = self;
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !note.text.isEmpty{
            completion?(text, note.text)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.textColor == UIColor.placeholderText {
            textField.text = nil
            textField.textColor = UIColor.label
        }
    }
}
