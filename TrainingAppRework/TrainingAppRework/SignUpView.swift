//
//  SignUpView.swift
//  TrainingAppRework
//
//  Created by Manne Sahlin on 2022-06-08.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var signUp: LogInViewModel
    
    var body: some View {
        VStack{
            EmailAndPasswordView()
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                signUp.signUp(email: email, password: password)
                
            }, label: {
                Text("REGISTER")
            })
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
            
        }
    }
}

