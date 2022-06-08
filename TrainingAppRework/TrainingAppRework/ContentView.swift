//
//  ContentView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI
import FirebaseAuth

let loginViewModel = LogInViewModel()


struct ContentView: View {
    
    
    @EnvironmentObject var logIn : LogInViewModel
    
    var body: some View {
        NavigationView{
            if logIn.signedIn {
                MenuView()
            } else {
                SignInView()
            }
            
        }.onAppear {
            logIn.signedIn = logIn.isSignedIn
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
