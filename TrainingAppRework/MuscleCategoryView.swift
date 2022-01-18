//
//  MuscleCategoryView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI

struct MuscleCategoryView: View {
    
    private let categoryList: [CategoryList] = [
        CategoryList(image: Image("chestpicture"), name: "Chest"),
        CategoryList(image: Image("training"), name: "Back"),
        CategoryList(image: Image("training"), name: "Shoulders"),
        CategoryList(image: Image("training"), name: "Legs"),
        CategoryList(image: Image("training"), name: "Core"),
        CategoryList(image: Image("training"), name: "Biceps"),
        CategoryList(image: Image("training"), name: "Triceps")
    ]
    
    var body: some View {
        
        List(categoryList) { exerciseCategory in
            NavigationLink(destination: ExercisesView(categoryName: exerciseCategory.name)) {
                HStack{
                    ZStack {
                        exerciseCategory.image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipped()
                            .cornerRadius(150)
                    }
                    Text(exerciseCategory.name).font(.headline)
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

struct CategoryList: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}
