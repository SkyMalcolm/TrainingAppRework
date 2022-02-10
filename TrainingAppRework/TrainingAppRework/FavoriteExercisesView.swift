//
//  FavoriteExercisesView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI

struct FavoriteExercisesView: View {
    
    @StateObject var favoriteViewModel = FavoriteViewModel()
    
    var categoryName: String
    
    var body: some View {
        VStack {
        Text(categoryName)
            List(favoriteViewModel.favorites) { favorite in
                VStack {
                    Button(action: {
                        favoriteViewModel.removeFavorite(exercise: favorite)
                        
                    }) {
                        Label("delete favorite", systemImage: "heart.fill").foregroundColor(.red)
                    }
                }
                VStack {
                    Text(favorite.exerciseName).font(.headline)
                    AsyncImage(url: URL(string: favorite.exerciseImage)) { ima in
                        ima.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 350)
                            .clipped()
                        //.cornerRadius(150)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
            }
            
        }.onAppear {
            favoriteViewModel.fetchFavorites(muscle: categoryName)
        }
    }
}



struct FavoriteExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteExercisesView(categoryName: "Chest")
    }
}
