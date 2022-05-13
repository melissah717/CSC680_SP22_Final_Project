//
//  Reminder.swift
//  iTinerary
//
//  Created by Samantha Saxton-Getty on 5/8/22.
//
//Resource: 

import SwiftUI

struct Reminder: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct ReminderData: Identifiable {
    var id = UUID().uuidString
    var remind: [Reminder]
    var remindDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [ReminderData] = [
    
    ReminderData(remind: [
    
        Reminder(title: "Study for 680 Final"),
        Reminder(title: "Finish 648 Final Project")
    ], remindDate: getSampleDate(offset: -2)),
    
    ReminderData(remind: [
    
        Reminder(title: "Buy Groceries"),
        Reminder(title: "Take the Dog to Vet")
    ], remindDate: getSampleDate(offset: 4))
]


