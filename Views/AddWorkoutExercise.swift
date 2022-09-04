//
//  AddExcercise.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 8/8/2022.
//

import SwiftUI

struct AddWorkoutExercise: View {
    
    let workoutID: String
    let workoutMuscleGroup: String
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var workoutListViewModel: WorkoutListViewModel
    @EnvironmentObject var exerciseTypeViewModel: ExerciseTypeViewModel
    
    @State var exerciseTypePicker: String = "Select Exercise"
    @State var exerciseSetsTextField: String = ""
    @State var exerciseRepsFieldText: String = ""
    @State var exerciseWeightFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Menu {
                    if workoutMuscleGroup == "Chest" {
                        Picker(selection: $exerciseTypePicker,
                               label: EmptyView(),
                               content:  {
                                Text("Bench Press").tag("Bench Press")
                                Text("Incline Smith Machine").tag("Incline Smith Machine")
                                Text("Incline Dumbell Press").tag("Incline Dumbell Press")
                                Text("Flat Dumbell Press").tag("Flat Dumbell Press")
                                Text("Cable Fly").tag("Cable Fly")
                                Text("Cable Fly Lower Chest").tag("Cable Fly")
                                Text("Dumbell Fly").tag("Dumbell Fly")
                                Text("Pullup").tag("Pullup")
                                }
                        )
                        .pickerStyle(.automatic)
                    } else if workoutMuscleGroup == "Back" {
                        Picker(selection: $exerciseTypePicker,
                               label: EmptyView(),
                               content:  {
                                Text("Barbell Row").tag("Barbell Row")
                                Text("Lat Pulldown").tag("Lat Pulldown")
                                Text("Seated Row").tag("Seated Row")
                                Text("Reverse Pulldown").tag("Reverse Pulldown")
                                Text("Cable Pulldown").tag("Cable Pulldown")
                                Text("Pullup").tag("Pullup")
                                }
                        )
                        .pickerStyle(.automatic)
                    } else if workoutMuscleGroup == "Shoulders" {
                        Picker(selection: $exerciseTypePicker,
                               label: EmptyView(),
                               content:  {
                                Text("Dumbell Press").tag("Dumbell Press")
                                Text("Military Press Standing").tag("Military Press Standing")
                                Text("Military Press Seated").tag("Military Press Seated")
                                Text("Dumbell Lateral Raise").tag("Dumbell Lateral Raise")
                                Text("Cable Lateral Raise").tag("Cable Lateral Raise")
                                Text("Dumbell Front Raise").tag("Dumbell Front Raise")
                                Text("Plate Front Raise").tag("Plate Front Raise")
                                }
                        )
                        .pickerStyle(.automatic)
                    } else if workoutMuscleGroup == "Legs" {
                        Picker(selection: $exerciseTypePicker,
                               label: EmptyView(),
                               content:  {
                                Text("Deadlift").tag("Deadlift")
                                Text("Squat").tag("Squat")
                                Text("Leg Press").tag("Leg Press")
                                Text("Quad Raise").tag("Quad Raise")
                                Text("Hamstring Curl").tag("Hamstring Curl")
                                Text("Calf Raise").tag("Calf Raise")
                                }
                        )
                        .pickerStyle(.automatic)
                    } else if workoutMuscleGroup == "Biceps" {
                        Picker(selection: $exerciseTypePicker,
                               label: EmptyView(),
                               content:  {
                                Text("Dumbell Bicep Curl").tag("Bicep Curl")
                                Text("Incline Bicep Curl").tag("Incline Bicep Curl")
                                Text("Bar Bicep Curl").tag("Bar Bicep Curl")
                                Text("Dumbell Hammer Curl").tag("Dumbell Hammer Curl")
                                Text("Cable Bicep Curl").tag("Cable Bicep Curl")
                                Text("Cable Hammer Curl").tag("Cable Hammer Curl")
                                }
                        )
                        .pickerStyle(.automatic)
                    } else if workoutMuscleGroup == "Triceps" {
                        Picker(selection: $exerciseTypePicker,
                               label: EmptyView(),
                               content:  {
                                Text("Skull Crusher").tag("Skull Crusher")
                                Text("Cable Pulldown").tag("Cable Pulldown")
                                Text("Overhead Cable").tag("Overhead Cable")
                                Text("Dip").tag("Dip")
                                }
                        )
                        .pickerStyle(.automatic)
                    }
                } label: {
                    Text(exerciseTypePicker)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                        .cornerRadius(10)

                }
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
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add Exercise 🦾")
    }
    
    func saveButtonPressed() {
        let newExercise: ExerciseModel = ExerciseModel(
            exercise: exerciseTypePicker,
            sets: exerciseSetsTextField,
            reps: exerciseRepsFieldText,
            weight: exerciseWeightFieldText)
        
        workoutListViewModel.addExercise(workoutID: workoutID, exercise: newExercise)
//        presentationMode.wrappedValue.dismiss()
    }
}

struct AddWorkoutExercise_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            AddWorkoutExercise()
        }
        .environmentObject(WorkoutListViewModel())
    }
}
