//
//  Favorite.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-02-07.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct Favorite: Identifiable {
    
    @DocumentID var id: String? = UUID().uuidString
    let favoriteImage: String
    let favoriteName: String
    
    
}
