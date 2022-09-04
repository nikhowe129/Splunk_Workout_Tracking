//
//  WorkoutModel.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 22/8/2022.
//

import Foundation

struct WorkoutModel: Identifiable, Codable {
    let id: String
    let date: Date
    let muscleGroup: String
    let workoutDesc: String
    var exercises: [ExerciseModel]
    
    init(id: String = UUID().uuidString, date: Date, muscleGroup: String, workoutDesc: String, exercises: [ExerciseModel]) {
        self.id = id
        self.date = date
        self.muscleGroup = muscleGroup
        self.workoutDesc = workoutDesc
        self.exercises = exercises
    }
    
    func updateWorkout() -> WorkoutModel {
        return WorkoutModel(id: id, date: date, muscleGroup: muscleGroup, workoutDesc: workoutDesc, exercises: exercises)
    }
}
