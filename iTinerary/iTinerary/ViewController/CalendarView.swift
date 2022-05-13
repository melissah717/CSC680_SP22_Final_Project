//
//  CalendarView.swift
//  iTinerary
//
//  Created by Samantha Saxton-Getty on 5/8/22.
//
//Resource: 

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    
    @State private var showModal = false
    
    @State private var showModal2 = false
    
    @State var refresh = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                DatePicker(currentDate: $currentDate, refresh: $refresh)
            }
            .padding(.vertical)
        }
        //        .safeAreaInset(edge: .bottom) {
        HStack {
            Button(action: {
                self.showModal.toggle()
                refresh.toggle()
            }, label: {
                Text("Create New")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("Blue"), in: Capsule())
            }).sheet(isPresented: $showModal) {
                CreateModalView(showModal: self.$showModal, reminderDate: currentDate)
            }
            Button(action: {
                showModal2.toggle()
            }, label: {
                Text("Reminders")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("Orange"), in: Capsule())
            }).sheet(isPresented: $showModal2) {
                ReminderModalView(showModal: self.$showModal2)
            }
        }
        .padding(.horizontal)
        .padding(.top, 0)
        .foregroundColor(.white)
        //        }
    }
}

struct DatePicker: View {
    
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    @Binding var refresh: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        currentMonth -= 1
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
                
                Button(action: {
                    withAnimation {
                        currentMonth += 1
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.primary)
                })
            }
            .padding(.horizontal)
            
            HStack(spacing: 5) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        ).onTapGesture {
                            currentDate = value.date
                        }
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.remindDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.remindDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle()
                        .fill(isSameDay(date1: task.remindDate, date2: currentDate) ? .white : Color("Yellow"))
                        .frame(width: 8, height: 8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 10)
        .frame(height: 60, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate() -> [String] {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDate) - 1
        let year = calendar.component(.year, from: currentDate)
        
        return ["\(year)",calendar.monthSymbols[month]]
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first!.date)
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}


extension Date {
    
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
