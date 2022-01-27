//
//  ExercisesView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-18.
//

import SwiftUI

struct ExercisesView: View {
    
    var categoryName: String
    
    private let exerciseList = [
        Exercise(exerciseImage: Image("chestpicture"), exerciseName: "Chestpress"),
        Exercise(exerciseImage: Image("training"), exerciseName: "Cable fly"),
        Exercise(exerciseImage: Image("training"), exerciseName: "Shoulders"),
        Exercise(exerciseImage: Image("training"), exerciseName: "Legs"),
        Exercise(exerciseImage: Image("training"), exerciseName: "Core"),
        Exercise(exerciseImage: Image("training"), exerciseName: "Biceps"),
        Exercise(exerciseImage: Image("training"), exerciseName: "Triceps")
    ]
    
    var body: some View {
        let exercise = exerciseList
        
        VStack{
            Text(categoryName)
            List(exercise) { exercises in
                HStack {
                    ZStack {
                        exercises.exerciseImage.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipped()
                            .cornerRadius(150)
                    }
                    Text(exercises.exerciseName).font(.headline)
                }.padding(7)
            }
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(categoryName: "Legs")
    }
}
