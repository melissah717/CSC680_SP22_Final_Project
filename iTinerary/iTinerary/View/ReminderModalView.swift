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
        Text("Reminders")
            .bold()
            .padding()
            .foregroundColor(Color.primary)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                if tasks.isEmpty {
                    Text("No Reminders Found!")
                }
                else {
                        ForEach(tasks) { task in
                            ForEach(task.reminders) { remind in
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(getDate(date: task.remindDate))
                                    Text(remind.title)
                                        .font(.title2.bold())
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color("Yellow").opacity(0.5).cornerRadius(10))
                        .foregroundColor(Color.primary)
                }
            }
        }
        Button(action: {
            self.showModal.toggle()
        }, label: {
            Text("Dismiss")
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color("Orange").opacity(0.75), in: Capsule())
                .foregroundColor(.white)
        })
    }
}
