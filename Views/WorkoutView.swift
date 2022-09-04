//
//  WorkoutView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 30/8/2022.
//

import SwiftUI

struct WorkoutView: View {
    
    let workout: WorkoutModel
    @EnvironmentObject var workoutListViewModel: WorkoutListViewModel
    
    @State var workoutDateField: Date = Date()
    @State var workoutMuscleGroupTextField: String = ""
    @State var workoutDescTextField: String = ""
    @State var workoutExercises: [ExerciseModel] = []
    
    init(workout: WorkoutModel) {
        self.workout = workout
        self._workoutDateField = State(initialValue: workout.date)
        self._workoutMuscleGroupTextField = State(initialValue: workout.muscleGroup)
        self._workoutDescTextField = State(initialValue: workout.workoutDesc)
        self._workoutExercises = State(initialValue: workout.exercises)
    }
    
    var body: some View {
            List {
                ForEach(workoutExercises) { exercise in
                    ExerciseRowView(exercise: exercise, workoutID: workout.id)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(workout.muscleGroup)
            .navigationBarItems(
                trailing:
                    NavigationLink("Add", destination: AddWorkoutExercise(workoutID: workout.id, workoutMuscleGroup: workout.muscleGroup))
        )
    }
}

struct WorkoutView_Previews: PreviewProvider {
    
    static var workout1 = WorkoutModel(
        date: Date(),
        muscleGroup: "Chest",
        workoutDesc: "Good energy, broke PB on bench",
        exercises: [
          ExerciseModel(exercise: "Bench Press", sets: "3", reps: "10", weight: "80"),
          ExerciseModel(exercise: "Incline Press", sets: "3", reps: "10", weight: "27.5"),
          ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
        ]
    )
    
    static var previews: some View {
        WorkoutView(workout: workout1)
            .environmentObject(WorkoutListViewModel())
    }
}
