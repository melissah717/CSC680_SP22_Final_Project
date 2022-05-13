//
//  ResultsViewController.swift
//  iTinerary
//
//  Created by Samantha Saxton-Getty on 4/29/22.
//

import Foundation
import UIKit
import SwiftUI

class ScheduleViewController: UIHostingController<CalendarView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Schedule"
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: CalendarView())
            
    }
    
}
