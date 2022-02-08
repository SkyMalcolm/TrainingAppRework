//
//  FavoriteViewModel.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-07.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FavoriteViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    let db = Firestore.firestore()
    
    func addFavorites(exercise: Exercise) {
        
        let muscleName = exercise.muscle
        guard let exerciseId = exercise.id else { return }
        guard let uid = auth.currentUser?.uid else {return}
        
        db.collection("users").document(uid).collection("favorites").document(exerciseId).setData(["favorite" : exerciseId, "muscle" : muscleName])
        
        
    }
    
    func fetchFavorites() {
        
        
    }
    
    func removeFavorite() {
        
        
    }
    
    
}
