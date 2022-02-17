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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let signInModel = LogInViewModel()
            ContentView()
                .environmentObject(signInModel)
                
        }
    }
}




