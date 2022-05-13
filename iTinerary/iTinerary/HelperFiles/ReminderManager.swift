//
//  Reminder.swift
//  iTinerary
//
//  Created by Samantha Saxton-Getty on 5/8/22.
//
//  Resource:

import SwiftUI

struct Reminder: Identifiable {
    var id = UUID().uuidString
    var title: String
}

struct ReminderData: Identifiable {
    var id = UUID().uuidString
    var reminders: [Reminder]
    var remindDate: Date
    
    mutating func addReminder(reminder: Reminder){
            reminders.append(reminder)
        }

}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [ReminderData] = [
    
    ReminderData(reminders: [
    
        Reminder(title: "Study for 680 Final"),
        Reminder(title: "Finish 648 Final Project")
    ], remindDate: getSampleDate(offset: -2)),
    
    ReminderData(reminders: [
    
        Reminder(title: "Buy Groceries"),
        Reminder(title: "Take the Dog to Vet")
    ], remindDate: getSampleDate(offset: 4))
]
