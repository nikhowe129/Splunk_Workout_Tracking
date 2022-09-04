//
//  ListRowView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 8/8/2022.
//

import SwiftUI

struct ListRowView: View {
    
    @State var isRowTapped: Bool = false
    
    let exercise: ExerciseModel

    var body: some View {
        
        HStack {
//            Spacer()
            Image(systemName: "checkmark.circle")
            Text(exercise.exercise)
            Text("Sets: " + String(exercise.sets))
//            Text("Reps: " + String(exercise.reps))
//            Text("Weight: " + String(exercise.weight))
            Spacer()
                .onTapGesture{
                    isRowTapped.toggle()
                }
            NavigationLink("", destination: EditExercise(exercise: exercise), isActive: $isRowTapped)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var exercise1 = ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: " ", weight: "12.5")
    static var exercise2 = ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
    
    static var previews: some View {
        Group {
            ListRowView(exercise: exercise1)
            ListRowView(exercise: exercise2)
        }
        .previewLayout(.sizeThatFits)
    }
}
