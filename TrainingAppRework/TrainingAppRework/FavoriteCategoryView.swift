//
//  FavoriteCategoryView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-07.
//

import SwiftUI

struct FavoriteCategoryView: View {
    @StateObject var favoriteMuscleViewModel = MuscleViewModel()
    
    var body: some View {
        
        List(favoriteMuscleViewModel.muscles) { favoriteMuscles in
            NavigationLink(destination: FavoriteExercisesView(categoryName: favoriteMuscles.name)) {
                HStack {
                    Text(favoriteMuscles.name)
                }
            }
        }.onAppear() {
            self.favoriteMuscleViewModel.fetchData()
        }
    }
}

struct FavoriteCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCategoryView()
    }
}
