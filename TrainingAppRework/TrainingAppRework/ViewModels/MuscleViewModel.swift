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
        print("fetch")
        db.collection("muscles").addSnapshotListener { (QuerySnapshot, error) in
            print("errorNotis: \(error)")
            
            guard let documents = QuerySnapshot?.documents else {
                print("no documents")
                return
            }
            
            self.muscles = documents.map { (QueryDocumentSnapshot) -> Muscle in
                let data = QueryDocumentSnapshot.data()
                
                let image = data["image"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                print("fetchData: \(name)")
                return Muscle(image: image, name: name)
            }
        }
    }
}

