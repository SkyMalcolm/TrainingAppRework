//
//  FavoriteCategoryView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-07.
//

import SwiftUI

struct FavoriteCategoryView: View {
    
    @StateObject var secondMuscleViewModel = MuscleViewModel()
    
    
    var body: some View {
        
        List(secondMuscleViewModel.muscles) { secondMuscles in
            NavigationLink(destination: FavoriteExercisesView()) {
                HStack {
                    Text(secondMuscles.name)
                }
            }
            
            
        }.onAppear() {
            self.secondMuscleViewModel.fetchData()
        }
        
    }
}

struct FavoriteCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCategoryView()
    }
}
