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
    
    @StateObject var muscleViewModel = MuscleViewModel()
    
    var body: some View {
       
        List(muscleViewModel.muscles) { muscle in
            NavigationLink(destination: ExercisesView(categoryName: muscle.name)) {
                HStack{
                    ZStack{
                        AsyncImage(url: URL(string: muscle.image)) { ima in
                            ima.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipped()
                                .cornerRadius(150)
                        } placeholder: {
                            ProgressView()
                        }
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

