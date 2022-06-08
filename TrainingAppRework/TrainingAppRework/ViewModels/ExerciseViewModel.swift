//
//  ExerciseViewModel.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-01.
//

import Foundation
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift

class ExerciseViewModel: ObservableObject {
    
    @Published var exercises = [Exercise]()
    
    private var db = Firestore.firestore()
    
    func fetchExerciseData(muscle: String) {
        
        db.collection("exercises").document(muscle).collection("exercises").getDocuments() { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("no documents")
                return
            }
            
            self.exercises = documents.map { (QueryDocumentSnapshot) -> Exercise in
                let firestoreData = QueryDocumentSnapshot.data()
                
                let id = QueryDocumentSnapshot.documentID
                let image = firestoreData["image"] as? String ?? ""
                let name = firestoreData["name"] as? String ?? ""
                return Exercise(id: id, exerciseImage: image, exerciseName: name, muscle: muscle)
            }
        }
    }
}
