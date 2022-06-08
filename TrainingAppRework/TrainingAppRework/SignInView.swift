//
//  SignInView.swift
//  TrainingAppRework
//
//  Created by Manne Sahlin on 2022-06-08.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var signIn : LogInViewModel
    
    var body: some View {
        VStack{
        EmailAndPasswordView()
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                signIn.signIn(email: email, password: password)
                
            }, label: {
                Text("SIGN IN")
            })
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(15.0)
            
            NavigationLink("CREATE ACCOUNT", destination: SignUpView())
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.blue)
                .cornerRadius(15.0)
        }
    }
}

