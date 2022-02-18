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
    
    @Published var favorites = [Exercise]()
    
    let auth = Auth.auth()
    
    let db = Firestore.firestore()
    
    func addFavorites(exercise: Exercise) {
        
        let muscleName = exercise.muscle
        guard let exerciseId = exercise.id else {
            print("no id")
            return }
        guard let uid = auth.currentUser?.uid else {
            print("no uid")
            return}
        
        db.collection("users").document(uid).collection("favorites").document(exerciseId).setData(["favorite" : exerciseId, "muscle" : muscleName])
        
        
    }
    
    func fetchFavorites(muscle: String) {
        guard let uid = auth.currentUser?.uid else {return}
        
        db.collection("users").document(uid).collection("favorites").whereField("muscle", isEqualTo: muscle).addSnapshotListener() { ( querySnapshot, error) in
            if let error = error {
                print ("Error getting documents: \(error)")
            } else {
                self.favorites.removeAll()
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                    let data = document.data()
                    guard let exerciseID = data["favorite"] as? String else {return}
                    guard let muscle = data["muscle"] as? String else {return}
                    
                    self.db.collection("exercises").document(muscle).collection("exercises").document(exerciseID).addSnapshotListener() { documentSnapshot, error in
                        
                        if let documentSnapShot = documentSnapshot {
                            if let data = documentSnapShot.data() {
                                
                                let id = documentSnapshot?.documentID
                                let image = data["image"] as! String
                                let name = data["name"] as! String
                                
                                let exercise = Exercise(id: id, exerciseImage: image, exerciseName: name, muscle: muscle)
                                self.favorites.append(exercise)
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    func removeFavorite(exercise: Exercise) {
        guard let uid = auth.currentUser?.uid else { return }
        guard let exerciseId = exercise.id else {
            print("no id")
            return }
        
        db.collection("users").document(uid).collection("favorites").document(exerciseId).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
        
    }
    
    
    
}
