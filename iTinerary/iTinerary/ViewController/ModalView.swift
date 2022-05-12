//
//  ModalView.swift
//  iTinerary
//
//  Created by Ze Lei on 5/11/22.
//

import Foundation
import SwiftUI

struct ModalView: View {
    
    @Binding var showModal: Bool
    @State var reminderName: String = ""
    @State var reminderDate: Date
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    
    private func saveReminder(){
        tasks.append(ReminderData(remind: [
            
            Reminder(title: reminderName)
        ], remindDate: reminderDate))
    }
    
    private func getDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $reminderName)
                .padding()
                .foregroundColor(Color.primary)
            
            Text(getDate(date: self.reminderDate))
                .padding()
                .foregroundColor(Color.primary)
            
            Button("Save"){
                saveReminder()
                self.showModal.toggle()
                
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            Button("Dismiss") {
                self.showModal.toggle()
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
}


