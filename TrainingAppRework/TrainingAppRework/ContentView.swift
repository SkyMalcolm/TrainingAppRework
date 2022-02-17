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
    @AppStorage("isDarkMode") private var isDarkMode = false
    
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
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
}


struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var signIn : LogInViewModel
    
    var body: some View {
        VStack {
            Text("Learn2Train").font(.largeTitle).fontWeight(.semibold).padding(.bottom, 20)
            Image("training").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
            TextField("Email", text: $email).disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password).disableAutocorrection(true).autocapitalization(.none).padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            
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


struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var signUp: LogInViewModel
    
    var body: some View {
        VStack {
            Text("Learn2Train").font(.largeTitle).fontWeight(.semibold).padding(.bottom, 20)
            Image("training").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
            TextField("Email", text: $email)
                .disableAutocorrection(true).autocapitalization(.none).padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password).disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
