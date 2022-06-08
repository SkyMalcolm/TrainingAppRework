//
//  MuscleViewModel.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-25.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class MuscleViewModel: ObservableObject {
    
    @Published var muscles = [Muscle]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("muscles").getDocuments() { (QuerySnapshot, error) in
    
            guard let documents = QuerySnapshot?.documents else {
                return
            }
            
            self.muscles = documents.map { (QueryDocumentSnapshot) -> Muscle in
                let firestoreData = QueryDocumentSnapshot.data()
                
                let image = firestoreData["image"] as? String ?? ""
                let name = firestoreData["name"] as? String ?? ""
                return Muscle(image: image, name: name)
            }
        }
    }
}

