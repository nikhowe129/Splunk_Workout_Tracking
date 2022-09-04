//
//  ExerciseTypeViewModel.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 4/9/2022.
//

import Foundation

class ExerciseTypeViewModel: ObservableObject {
    @Published var exerciseTypes: [String : [String]] = [
        "Chest": [
            "Bench Press",
            "Incline Dumbell"
        ],
        "Shoulders": [
            "Dumbell Shoulder Press",
            "Military Press"
        ],
        "Back": [
            "Barbell Row",
            "Lat Pulldown"
        ]
    
    ]
}

