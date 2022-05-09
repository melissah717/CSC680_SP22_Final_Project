////
////  ScheduleViewController.swift
////  iTinerary
////
////  Created by Samantha Saxton-Getty on 5/8/22.
////
//// Resource:
//
import Foundation
import UIKit
import SwiftUI

class ScheduleViewController: UIHostingController<ContentView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Schedule"
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: ContentView())
            
    }
    
}
