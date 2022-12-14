//
//  WorkoutListViewModel.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 22/8/2022.
//

import Foundation

class WorkoutListViewModel: ObservableObject {
    
    let userDefaults = UserDefaults.standard
    
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
    
    func addWorkout(date: String, muscleGroup: String, workoutDesc: String, exercises: [ExerciseModel]) {
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
//        if let data = try? encoder.encode(workouts) {
//            pushToSplunk(JSON: String(data: data, encoding: .utf8)!)}
    }
        
    
    func pushToSplunk() {
        guard let JSONEncoded = try? JSONEncoder().encode(workouts) else {
            print("Failed to Encode")
            return
        }
        
//        let url = URL(string: "http://localhost:8088/services/collector/event?auto_extract_timestamp=true")!
//        let url = URL(string: "http://localhost:8088/services/collector/raw")!
        let url = URL(string:(userDefaults.string(forKey: "HTTPEndpoint") ?? "") +
                        "/services/collector/raw")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Splunk " +
                         (userDefaults.string(forKey: "HECToken") ?? ""),
//                         "HEC TOKEN",
                         forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = JSONEncoded
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            print("Reponse: \(response)")
            guard let data = data else {return}
            
//            do {
//                let workoutModel = try JSONDecoder().decode(WorkoutModel.self, from: data)
//            } catch let jsonErr {
//                print(jsonErr)
//            }
        }
        task.resume()
    }
    
    func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encodedData, forKey: workoutsKey)
        }
    }
}
