//
//  AddExcercise.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 8/8/2022.
//

import SwiftUI

struct AddExercise: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var exerciseTextFieldText: String = ""
    @State var exerciseSetsTextField: String = ""
    @State var exerciseRepsFieldText: String = ""
    @State var exerciseWeightFieldText: String = ""
    
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
        listViewModel.addExcercise(exercise: exerciseTextFieldText, sets: exerciseSetsTextField, reps: exerciseRepsFieldText, weight: exerciseWeightFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddExcercise_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddExercise()
        }
        .environmentObject(ListViewModel())
    }
}
