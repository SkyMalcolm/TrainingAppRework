//
//  Exercise.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-25.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Exercise: Identifiable {
    @DocumentID var id: String?
    let exerciseImage: String
    let exerciseName: String
    let muscle: String

}
