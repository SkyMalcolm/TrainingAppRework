//
//  MuscleCategoryView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI

struct MuscleCategoryView: View {

    private let exerciseList: [ExerciseItem] = [
        ExerciseItem(image: Image("chestpicture"), name: "Chest"),
        ExerciseItem(image: Image("training"), name: "Back"),
        ExerciseItem(image: Image("training"), name: "Shoulders"),
        ExerciseItem(image: Image("training"), name: "Legs"),
        ExerciseItem(image: Image("training"), name: "Core"),
        ExerciseItem(image: Image("training"), name: "Biceps"),
        ExerciseItem(image: Image("training"), name: "Triceps")
    ]

    var body: some View {

        List(exerciseList) { exerciseItem in
            NavigationLink(destination: EmptyView()) {
                HStack{
                    ZStack {
                        exerciseItem.image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipped()
                            .cornerRadius(150)
                    }
                    Text(exerciseItem.name).font(.headline)
                }.padding(7)
            }
            .navigationBarTitle("Muscle Categorys")
            }


    }
}

struct MuscleCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MuscleCategoryView()
    }
}

struct ExerciseItem: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}
