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
       
        List(muscleViewModel.muscles) { muscle in
            NavigationLink(destination: ExercisesView(categoryName: muscle.name)) {
                HStack{
                    ZStack{
                        Image(muscle.image).resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipped()
                            .cornerRadius(150)
        
                    }
                    Text(muscle.name).font(.headline)
                }.padding(7)
                .navigationBarTitle("Muscle Categorys")
                
            }
        }
        .onAppear() {
            self.muscleViewModel.fetchData()
        }
    }
}



struct MuscleCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MuscleCategoryView()
    }
}

