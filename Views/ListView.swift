//
//  ListView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 8/8/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
  
    var body: some View {
        List {
            ForEach(listViewModel.exercises) { exercise in
                ListRowView(exercise: exercise)
            }
            .onDelete(perform: listViewModel.deleteExcercise)
            .onMove(perform: listViewModel.moveExcercise)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Workout List 🏋️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddExercise())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ListView()
            }
            .environmentObject(ListViewModel())
            NavigationView {
                ListView()
            }
            .environmentObject(ListViewModel())
        }
    }
}
