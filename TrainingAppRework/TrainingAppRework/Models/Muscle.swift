//
//  Muscle.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-25.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Muscle: Identifiable {
    @DocumentID var id: String?
    var image: String
    var name: String
}
