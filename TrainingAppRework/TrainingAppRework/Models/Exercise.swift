//
//  Exercise.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-25.
//

import Foundation
import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let exerciseImage: Image
    let exerciseName: String
}
