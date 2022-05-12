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
    @State var reminderName: String = ""
    @State var reminderDate: Date
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext

    let task = tasks

    var body: some View {
        
        if tasks.isEmpty {
            return Text("No Reminders Found!")
        }
        else {
            ForEach(tasks) { task in ForEach(task.remind) { remind in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                            Text(task.title)
                                .font(.title2.bold())
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("Yellow").opacity(0.5).cornerRadius(10))
                    
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
    }
}
