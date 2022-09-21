//
//  Splunk_Workout_TrackingApp.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 31/7/2022.
//

import SwiftUI

@main
struct Splunk_Workout_TrackingApp: App {
    
//    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var workoutListViewModel: WorkoutListViewModel = WorkoutListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    WorkoutListView()
                }
                .tabItem {
                    Label("Workouts", systemImage: "house.fill")
                }
                SettingsView()
                    .tabItem{
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }

            .environmentObject(workoutListViewModel)
        }
    }
}
