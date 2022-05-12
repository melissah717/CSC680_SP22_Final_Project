//
//  ModalView.swift
//  iTinerary
//
//  Created by Ze Lei on 5/11/22.
//

import Foundation
import SwiftUI

struct ModalView: View {
    // 1.
    @Binding var showModal: Bool
    @State var title: String = ""
    @State var date: Date
    
    private func saveReminder(){
        
    }
    
    private func getDate(date: Date) -> String{
        let formatter = DateFormatter()
            formatter.locale = .current
            formatter.dateFormat = "MMMM d, yyyy"
            return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
            // 2.
            Text(getDate(date: self.date))
                .padding()
                .foregroundColor(Color.primary)
                 
            Button("Save"){
                saveReminder()
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


