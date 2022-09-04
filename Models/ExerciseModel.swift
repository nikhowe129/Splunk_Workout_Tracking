//
//  Exercise.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 15/8/2022.
///Users/nhowe/Desktop/Swift Code/Splunk_Workout_Tracking/Splunk_Workout_Tracking/Models/ExerciseModel.swift

import Foundation

struct ExerciseModel: Identifiable, Codable {
    let id: String
    let exercise: String
    let sets: String
    let reps: String
    let weight: String
    
    init(id: String = UUID().uuidString, exercise: String, sets: String, reps: String, weight: String) {
        self.id = id
        self.exercise = exercise
        self.sets = sets
        self.reps = reps
        self.weight = weight
    }
    
    func updateExercise() -> ExerciseModel {
        return ExerciseModel(id: id, exercise: exercise, sets: sets, reps: reps, weight: weight)
    }
    
}
