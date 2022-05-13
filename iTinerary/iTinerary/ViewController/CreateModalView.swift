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
                Button("Save"){
                    saveReminder()
                    self.showModal.toggle()
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color("Blue"), in: Capsule())
                .foregroundColor(Color.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                Button("Dismiss") {
                    self.showModal.toggle()
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color("Orange"), in: Capsule())
                .foregroundColor(Color.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .foregroundColor(.white)
        }
    }
}
