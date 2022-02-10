//
//  MenuView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var signOut: LogInViewModel
    var body: some View {

        VStack{
            NavigationLink(destination: MuscleCategoryView()){
                Text("Exercises")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)

            NavigationLink(destination: FavoriteCategoryView()){
                Text("Favorites")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
            
            Button(action: {
                signOut.signOut()
            }, label: {
                Text("Sign Out")
            })
            

            
            

        }

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
