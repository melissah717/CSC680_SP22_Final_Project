//
//  ReminderModalView.swift
//  iTinerary
//
//  Created by Samantha Saxton-Getty on 5/12/22.
//

import Foundation
import SwiftUI

struct ReminderModalView: View {
    
    @Binding var showModal: Bool
    
    private func getDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: date)
    }
    
    var body: some View {
        
        if tasks.isEmpty {
            Text("No Reminders Found!")
        }
        else {
//            ScrollView(.vertical, showsIndicators: false) {
                ForEach(tasks) { task in
                    ForEach(task.remind) { remind in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(getDate(date: task.remindDate))
                            Text(remind.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                            Text(remind.title)
                                .font(.title2.bold())
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("Yellow").opacity(0.5).cornerRadius(10))
//            }
            
        }
        Button("Dismiss") {
            self.showModal.toggle()
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(Color("Orange"), in: Capsule())
        .foregroundColor(Color.primary)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

