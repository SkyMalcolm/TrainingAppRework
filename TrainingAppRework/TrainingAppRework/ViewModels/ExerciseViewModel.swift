//
//  ExerciseViewModel.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-01.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class ExerciseViewModel: ObservableObject {
    
    @Published var exercises = [Exercise]()
    
    private var db = Firestore.firestore()
    
    func fetchExerciseData() {
        
        db.collection("exercises").addSnapshotListener { (QuerySnapshot, error) in
            
            
            guard let documents = QuerySnapshot?.documents else {
                print("no documents")
                return
            }
            
            self.exercises = documents.map { (QueryDocumentSnapshot) -> Exercise in
                let data = QueryDocumentSnapshot.data()
                
                let image = data["image"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                
                return Exercise(exerciseImage: image, exerciseName: name)
            }
        }
    }
}
