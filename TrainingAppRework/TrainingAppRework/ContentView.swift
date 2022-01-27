//
//  ContentView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI
import FirebaseAuth

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            SignInView()
        }
    }
    
}


struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
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
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password).disableAutocorrection(true).autocapitalization(.none).padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            NavigationLink("SIGN IN", destination: MenuView())
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
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password).disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            NavigationLink(destination: MenuView()) {
                Button(action: {
                    
                    
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
