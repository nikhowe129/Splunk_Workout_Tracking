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
        }

        .listStyle(PlainListStyle())
        .navigationTitle("Workout List 🏋️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddWorkout())
        )
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
