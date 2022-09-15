//
//  SettingsView.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 14/9/2022.
//

import SwiftUI
import Foundation

struct SettingsView: View {
    
    let userDefaults = UserDefaults.standard
    
    @State var HECToken: String = ""
    
    init() {
        self._HECToken = State(initialValue: userDefaults.string(forKey: "HECToken") ?? "")
    }
    
    var body: some View {
        VStack {
            TextField("Splunk HEC Token", text: $HECToken)
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
            Spacer()
        }
        .padding(14)
        .padding(.top, 50)
    }
    
    func saveButtonPressed() {
        userDefaults.set(HECToken, forKey: "HECToken")
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
