//
//  CalendarViewModel.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-16.
//

import Foundation
import SwiftUI

class CalendarViewModel: ObservableObject {
    
    func openCalendar() {
        guard let url = URL(string: "calshow://") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    
}
