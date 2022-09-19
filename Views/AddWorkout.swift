//
//  AddWorkout.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 29/8/2022.
//

import SwiftUI

struct AddWorkout: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var workoutListViewModel: WorkoutListViewModel
    
    @State var workoutDateField: Date = Date()
    @State var workoutDescTextField: String = ""
    @State var workoutExercises: [ExerciseModel] = []
    @State var workoutMuscleGroupPicker: String = "Select Muscle Group"
    
    let dateFormatter = DateFormatter()
    
    var body: some View {
        ScrollView {
            VStack {
                DatePicker(selection: $workoutDateField,
                           displayedComponents: [.date],
                           label: { Text("Workout Date") }
                )
                    .datePickerStyle(.compact)
                Menu {
                    Picker(selection: $workoutMuscleGroupPicker,
                           label: EmptyView(),
                           content:  {
                        Text("Chest").tag("Chest")
                        Text("Shoulders").tag("Shoulders")
                        Text("Back").tag("Back")
                        Text("Legs").tag("Legs")
                        Text("Biceps").tag("Biceps")
                        Text("Triceps").tag("Triceps")
                    })
                    .pickerStyle(.automatic)
                } label: {
                    Text(workoutMuscleGroupPicker)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                        .cornerRadius(10)

                }
                TextField("Workout Description", text: $workoutDescTextField)
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
        .navigationTitle("Add Workout 🦾")
    }
    
    func saveButtonPressed() {
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
//        dateFormatter.dateFormat = "MM/dd/yyyy"
        workoutListViewModel.addWorkout(date:
                                            dateFormatter.string(from: workoutDateField)
                                            ,muscleGroup: workoutMuscleGroupPicker, workoutDesc: workoutDescTextField, exercises: workoutExercises)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddWorkout()
        }
        .environmentObject(WorkoutListViewModel())
    }
}
