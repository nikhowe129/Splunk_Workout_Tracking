//
//  EditExcercise.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 15/8/2022.
//

import SwiftUI

struct EditWorkoutExercise: View {
    
    let workoutID: String
    let exercise: ExerciseModel

    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var workoutListViewModel: WorkoutListViewModel
    
    @State var exerciseTextFieldText: String = ""
    @State var exerciseSetsTextField: String = ""
    @State var exerciseRepsFieldText: String = ""
    @State var exerciseWeightFieldText: String = ""
    
    init(exercise: ExerciseModel, workoutID: String) {
        self.workoutID = workoutID
        self.exercise = exercise
        self._exerciseTextFieldText = State(initialValue: exercise.exercise)
        self._exerciseSetsTextField = State(initialValue: exercise.sets)
        self._exerciseRepsFieldText = State(initialValue: exercise.reps)
        self._exerciseWeightFieldText = State(initialValue: exercise.weight)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Exercise", text: $exerciseTextFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                    .cornerRadius(10)
                TextField("Sets", text: $exerciseSetsTextField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                    .cornerRadius(10)
                TextField("Reps", text: $exerciseRepsFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                    .cornerRadius(10)
                TextField("Weight (Kg)", text: $exerciseWeightFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                    .cornerRadius(10)
                
                Button(action: updateButtonPressed, label: {
                    Text("Update".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
                Button(action: removeButtonPressed, label: {
                    Text("Remove".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Edit Excercise 🦾")
    }
    
    func updateButtonPressed() {
        let updatedExercise: ExerciseModel = ExerciseModel(id: exercise.id, exercise: exerciseTextFieldText, sets: exerciseSetsTextField, reps: exerciseRepsFieldText, weight: exerciseWeightFieldText)
        workoutListViewModel.updateExercise(workoutID: workoutID, exercise: updatedExercise)
//        presentationMode.wrappedValue.dismiss()
    }
    
    func removeButtonPressed() {
        workoutListViewModel.deleteExercise(workoutID: workoutID, exerciseID: exercise.id)
    }
}


struct EditWorkoutExercise_Previews: PreviewProvider {
    
    static var exercise1 = ExerciseModel(exercise: "Dumbell Fly", sets: "3", reps: "12", weight: "12.5")
    
    static var previews: some View {
        NavigationView {
            EditWorkoutExercise(exercise: exercise1, workoutID: "1")
        }
        .environmentObject(WorkoutListViewModel())
    }
}
