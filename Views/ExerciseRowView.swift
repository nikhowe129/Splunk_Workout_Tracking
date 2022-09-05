//
//  ExerciseRowView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 30/8/2022.
//

import SwiftUI

struct ExerciseRowView: View {
    
    @State var isRowTapped: Bool = false
    let exercise: ExerciseModel
    let workoutID: String
    let workoutMuscleGroup: String
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        HStack{
                            Text(exercise.exercise)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.bottom, 1.0)
                            Spacer()
                        }
                        HStack {
                            Text("Sets: " + exercise.sets + "x")
                                .font(.callout)
                            Text(" | ")
                                .font(.callout)
                                .fontWeight(.heavy)
                            Text("Reps: " + exercise.reps + "x")
                                .font(.callout)
                            Spacer()
                        }
                        HStack {
                            Text("Weight: " + exercise.weight + " kgs")
                                .font(.callout)
                            Spacer()
                        }
                    }
                    .padding(.vertical, 7.0)
                    Spacer()
                    NavigationLink("", destination: EditWorkoutExercise(exercise: exercise, workoutID: workoutID, workoutMuscleGroup: workoutMuscleGroup), isActive: $isRowTapped)
                }
                .onTapGesture{
                    isRowTapped.toggle()
            }
            }
        }
    }
}

struct ExerciseRowView_Previews: PreviewProvider {
    
    static var exercise1 = ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
    static var exercise2 = ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
    
    static var previews: some View {
        Group {
            ExerciseRowView(exercise: exercise1, workoutID: "0", workoutMuscleGroup: "Chest")
//            ExerciseRowView(exercise: exercise2, workoutID: "1")
        }
    }
}
