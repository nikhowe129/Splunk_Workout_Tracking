//
//  WorkoutListRowView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 22/8/2022.
//

import SwiftUI

struct WorkoutListRowView: View {
    
    @State var isRowTapped: Bool = false
    
    let workout: WorkoutModel
   
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack{
                        HStack {
                            Text(workout.muscleGroup)
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        HStack {
                            Text(workout.date)
                                .font(.callout)
                                .italic()
                                .padding(.top, 0.0)
                            Spacer()
                        }
                    }
                    .padding(.vertical, 7.0)
                    Spacer()
                    NavigationLink("", destination: WorkoutView(workout: workout), isActive: $isRowTapped)
                }
                .onTapGesture {
                   isRowTapped.toggle()
            }
            }
        }
    }
}

struct WorkoutListRowView_Previews: PreviewProvider {
    
    static var workout1 = WorkoutModel(
        date: "01/01/2022",
        muscleGroup: "Chest Day",
        workoutDesc: "Good energy, broke PB on bench",
        exercises: [
          ExerciseModel(exercise: "Bench Press", sets: "3", reps: "10", weight: "80"),
          ExerciseModel(exercise: "Incline Press", sets: "3", reps: "10", weight: "27.5"),
          ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
        ]
    )
    static var previews: some View {
        WorkoutListRowView(workout: workout1)
    }
}
