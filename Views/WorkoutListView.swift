//
//  WorkoutListView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 22/8/2022.
//

import SwiftUI

struct WorkoutListView: View {
    
    @EnvironmentObject var workoutListViewModel: WorkoutListViewModel
    
    var body: some View {
        List {
            ForEach(workoutListViewModel.workouts) {
                workout in
                WorkoutListRowView(workout: workout)
            }
            .onDelete(perform: workoutListViewModel.deleteWorkout)
            .onMove(perform: workoutListViewModel.moveWorkout)
            
            if workoutListViewModel.workouts.count > 0 {
                Button(action: pushToSplunkButtonPressed, label: {
                    Text("Push to Splunk".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.top, 15.0)
            }
            Button(action: workoutListViewModel.pushToSplunk, label: {
                Text("testing".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Workouts 🏋️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddWorkout())
        )
    }
    
    func pushToSplunkButtonPressed() {
        print("pressed")
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutListView()
        }
        .environmentObject(WorkoutListViewModel())
    }
}
