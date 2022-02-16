//
//  TrainingAppReworkApp.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI
import Firebase

@main
struct TrainingAppReworkApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let signInModel = LogInViewModel()
            ContentView()//.preferredColorScheme(isDarkMode ? .dark : .light).accentColor(.primary)
                
                .environmentObject(signInModel)
                
        }
    }
}




