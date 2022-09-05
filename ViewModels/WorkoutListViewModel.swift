//
//  WorkoutListViewModel.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 22/8/2022.
//

import Foundation

class WorkoutListViewModel: ObservableObject {
    
    @Published var workouts: [WorkoutModel] = [] {
        didSet {
            saveWorkouts()
        }
    }
    
    let workoutsKey: String = "workout_list"
    
    init() {
        getWorkouts()
    }
    
    func getWorkouts() {
//        let newWorkouts: [WorkoutModel] = [
//            WorkoutModel(date: Date(),
//                         muscleGroup: "Shoulder Day",
//                         workoutDesc: "Good energy, broke PB on bench",
//                         exercises: [
//                            ExerciseModel(exercise: "Bench Press", sets: "3", reps: "10", weight: "80"),
//                            ExerciseModel(exercise: "Incline Press", sets: "3", reps: "10", weight: "27.5"),
//                            ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
//                         ]
//            ),
//            WorkoutModel(date: Date(),
//                         muscleGroup: "Leg Day",
//                         workoutDesc: "Average energy, did the needful",
//                         exercises: [
//                            ExerciseModel(exercise: "Leg Press", sets: "3", reps: "10", weight: "120"),
//                            ExerciseModel(exercise: "Bicep Curl", sets: "3", reps: "10", weight: "14"),
//                         ]
//         )
//        ]
//        workouts.append(contentsOf: newWorkouts)
        guard
            let data = UserDefaults.standard.data(forKey: workoutsKey),
            let savedWorkouts = try? JSONDecoder().decode([WorkoutModel].self, from: data)
        else { return }
        
        self.workouts = savedWorkouts
    }
    
    func deleteWorkout(indexSet: IndexSet) {
        workouts.remove(atOffsets: indexSet)
    }
    
    func moveWorkout(from: IndexSet, to: Int) {
        workouts.move(fromOffsets: from, toOffset: to)
    }
    
    func addWorkout(date: Date, muscleGroup: String, workoutDesc: String, exercises: [ExerciseModel]) {
        print(date)
        let newWorkout = WorkoutModel(date: date, muscleGroup: muscleGroup, workoutDesc: workoutDesc, exercises: exercises)
        workouts.insert(newWorkout, at: 0 )
    }
    
    func updateWorkout(workout: WorkoutModel) {
        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
            workouts[index] = workout.updateWorkout()
        }
    }
    
    func addExercise(workoutID: String, exercise: ExerciseModel) {
        if let index = workouts.firstIndex(where: { $0.id == workoutID }) {
            workouts[index].exercises.append(exercise)
        }
    }
    
    func deleteExercise(workoutID: String, exerciseID: String) {
        if let workoutIndex = workouts.firstIndex(where: { $0.id == workoutID }) {
            if let exerciseIndex = workouts[workoutIndex].exercises.firstIndex(where: { $0.id == exerciseID }) {
                workouts[workoutIndex].exercises.remove(at: exerciseIndex)
            }
        }
    }
    
    func updateExercise(workoutID: String, exercise: ExerciseModel) {
        if let workoutIndex = workouts.firstIndex(where: { $0.id == workoutID }) {
            if let exerciseIndex = workouts[workoutIndex].exercises.firstIndex(where: { $0.id == exercise.id }) {

                workouts[workoutIndex].exercises[exerciseIndex] = exercise.updateExercise()
            }
        }
    }
    
    func convertWorkoutToJSON() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let data = try? encoder.encode(workouts) {
            print(String(data: data, encoding: .utf8)!)
        }
    }
    
    func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encodedData, forKey: workoutsKey)
        }
    }
}
