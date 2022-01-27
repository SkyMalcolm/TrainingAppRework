//
//  MuscleCategoryViewModel.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-25.
//

import Foundation

class MuscleCategoryViewModel: ObservableObject {
    
    @Published var categoryList: [CategoryList] = [
        CategoryList(image: Image("chestpicture"), name: "Chest"),
        CategoryList(image: Image("training"), name: "Back"),
        CategoryList(image: Image("training"), name: "Shoulders"),
        CategoryList(image: Image("training"), name: "Legs"),
        CategoryList(image: Image("training"), name: "Core"),
        CategoryList(image: Image("training"), name: "Biceps"),
        CategoryList(image: Image("training"), name: "Triceps")
    ]
    
}

struct CategoryList: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}
