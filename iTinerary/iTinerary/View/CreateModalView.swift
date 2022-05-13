//
//  CreateModalView.swift
//  iTinerary
//
//  Created by Ze Lei on 5/11/22.
//

import Foundation
import SwiftUI

struct CreateModalView: View {
    
    @Binding var showModal: Bool
    @State var reminderName: String = ""
    @State var reminderDate: Date
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    private func saveReminder(){
        if let taskIndex = tasks.firstIndex(where: { task in
            return isSameDay(date1: task.remindDate, date2: reminderDate)
        }){
            tasks[taskIndex].addReminder(reminder: Reminder(title: reminderName))
            
        }else{
            tasks.append(ReminderData(reminders: [
                
                Reminder(title: reminderName)
            ], remindDate: reminderDate))
        }
        
    }
    
    private func getDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            Text("New Reminder")
                .bold()
                .padding()
                .foregroundColor(Color.primary)
            
            TextField("Title", text: $reminderName)
                .padding()
                .foregroundColor(Color.primary)
            
            Text(getDate(date: self.reminderDate))
                .padding()
                .foregroundColor(Color.primary)
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button(action: {
                    self.showModal.toggle()
                }, label: {
                    Text("Dismiss")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Orange").opacity(0.75), in: Capsule())
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                })
                Button(action: {
                    saveReminder()
                    self.showModal.toggle()
                }, label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Blue"), in: Capsule())
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                })
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
        }
    }
}
