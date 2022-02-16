//
//  CalendarView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-10.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    
    @State var notes: String = ""
    
    var body: some View {
        
        DatePicker("Calendar", selection: $date, displayedComponents: [.date]).datePickerStyle(GraphicalDatePickerStyle())
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
