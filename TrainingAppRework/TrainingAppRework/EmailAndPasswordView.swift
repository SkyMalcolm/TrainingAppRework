//
//  EmailAndPasswordView.swift
//  TrainingAppRework
//
//  Created by Manne Sahlin on 2022-06-08.
//

import Foundation
import SwiftUI

struct EmailAndPasswordView: View{
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
        }
    }
}
