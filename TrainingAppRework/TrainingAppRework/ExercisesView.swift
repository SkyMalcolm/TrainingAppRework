//
//  ExercisesView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-18.
//

import SwiftUI

struct ExercisesView: View {
    
    @StateObject var exerciseViewModel = ExerciseViewModel()
    @StateObject var favoriteViewModel = FavoriteViewModel()
    
    var categoryName: String
    
    var body: some View {
        VStack{
            Text(categoryName)
            List(exerciseViewModel.exercises) { exercise in
                VStack {
                    Text(exercise.exerciseName).font(.headline)
                    Button(action: {
                        favoriteViewModel.addFavorites(exercise: exercise)
                        
                    }) {
                        Label("Add To Favorite", systemImage: "heart.fill").foregroundColor(.red)
                    }
                }
                VStack {
                    
                    AsyncImage(url: URL(string: exercise.exerciseImage)) { ima in
                        ima.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320, height: 350)
                            .clipped()
                        
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            }.padding(7)
            
        }.onAppear() {
            self.exerciseViewModel.fetchExerciseData(muscle: categoryName)
        }
        
    }
    
}

/*struct ExercisesView_Previews: PreviewProvider {
 static var previews: some View {
 ExercisesView(categoryName: "Legs")
 }
 }*/
