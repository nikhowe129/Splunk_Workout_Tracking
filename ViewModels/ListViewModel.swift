//
//  ListViewModel.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 15/8/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var exercises: [ExerciseModel] = []
    
    init() {
        getExcercises()
    }
    
    func getExcercises() {
        let newExcercises: [ExerciseModel] = [
            ExerciseModel(exercise: "Bench Press", sets: "3", reps: "10", weight: "80"),
            ExerciseModel(exercise: "Incline Press", sets: "3", reps: "10", weight: "27.5"),
            ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
        ]
        exercises.append(contentsOf: newExcercises)
    }
    
    func deleteExcercise(indexSet: IndexSet) {
        exercises.remove(atOffsets: indexSet)
    }
    
    func moveExcercise(from: IndexSet, to: Int) {
        exercises.move(fromOffsets: from, toOffset: to)
    }
    
    func addExcercise(exercise: String, sets: String, reps: String, weight: String) {
        let newExercise = ExerciseModel(exercise: exercise, sets: sets, reps: reps, weight: weight)
        exercises.append(newExercise)
    }
    
    func updateExercise(exercise: ExerciseModel) {
        if let index = exercises.firstIndex(where: { $0.id == exercise.id }) {
            exercises[index] = exercise.updateExercise()
        }
    }
}
