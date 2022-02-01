//
//  ExercisesView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-18.
//

import SwiftUI

struct ExercisesView: View {
    
    @StateObject var exerciseViewModel = ExerciseViewModel()
    
    var categoryName: String
    
    var body: some View {
        
        
        VStack{
            Text(categoryName)
            List(exerciseViewModel.exercises) { exercise in
                HStack {
                    ZStack {
                        AsyncImage(url: URL(string: exercise.exerciseImage)) { ima in
                            ima.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipped()
                                .cornerRadius(150)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text(exercise.exerciseName).font(.headline)
                }.padding(7)
            }
        }
        .onAppear() {
            self.exerciseViewModel.fetchExerciseData()
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(categoryName: "Legs")
    }
}
