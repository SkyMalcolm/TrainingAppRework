//
//  ExercisesView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-18.
//

import SwiftUI

struct ExercisesView: View {
    
    var categoryName: String
    
    private let exerciseList: [ExerciseList] = [
        ExerciseList(image: Image("chestpicture"), name: "Chestpress"),
        ExerciseList(image: Image("training"), name: "Cable fly"),
        ExerciseList(image: Image("training"), name: "Shoulders"),
        ExerciseList(image: Image("training"), name: "Legs"),
        ExerciseList(image: Image("training"), name: "Core"),
        ExerciseList(image: Image("training"), name: "Biceps"),
        ExerciseList(image: Image("training"), name: "Triceps")
    ]
    
    var body: some View {
        VStack{
            Text(categoryName)
            List(exerciseList) { exercise in
                HStack {
                    ZStack {
                        exercise.image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipped()
                            .cornerRadius(150)
                    }
                    Text(exercise.name).font(.headline)
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

struct ExerciseList: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}
