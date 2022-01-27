//
//  MuscleCategoryView.swift
//  TrainingAppRework
//
//  Created by Malcolm Lennartsson on 2022-01-14.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct MuscleCategoryView: View {
    
    /*private let muscleList = [
     Muscle(image: Image("chestpicture"), name: "Chest"),
     Muscle(image: Image("training"), name: "Back"),
     Muscle(image: Image("training"), name: "Shoulders"),
     Muscle(image: Image("training"), name: "Legs"),
     Muscle(image: Image("training"), name: "Core"),
     Muscle(image: Image("training"), name: "Biceps"),
     Muscle(image: Image("training"), name: "Triceps")
     ]*/
    
    @StateObject var muscleViewModel = MuscleViewModel()
    
    var body: some View {
        
        //let muscle = muscleList
        
        /*Text("Hej")
         .onAppear() {
         db.collection("cities").document("LA").setData([
         "name": "Los Angeles",
         "state": "CA",
         "country": "USA"
         ]) { err in
         if let err = err {
         print("Error writing document: \(err)")
         } else {
         print("Document successfully written!")
         }
         }
         }*/
        List(muscleViewModel.muscles) { muscle in
            NavigationLink(destination: ExercisesView(categoryName: muscle.name)) {
                HStack{
                    ZStack{
                        Text(muscle.image).font(.title)//.resizable()
                        //.aspectRatio(contentMode: .fill)
                        //.frame(width: 75, height: 75)
                        //.clipped()
                        //.cornerRadius(150)
                        Text(muscle.name).font(.subheadline)
                    }
                    //Text(muscle.name).font(.headline)
                }//.padding(7)
                
                .navigationBarTitle("Muscle Categorys")
                .onAppear() {
                    self.muscleViewModel.fetchData()
                }
            }
        }
    }
}


struct MuscleCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MuscleCategoryView()
    }
}

