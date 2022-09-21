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
    @State var HTTPEndpoint: String = ""
    
    init() {
        self._HECToken = State(initialValue: userDefaults.string(forKey: "HECToken") ?? "")
        self._HTTPEndpoint = State(initialValue: userDefaults.string(forKey: "HTTPEndpoint") ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            TextField("Splunk HEC Token", text: $HECToken)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(hue: 0.68, saturation: 0.0, brightness: 0.921, opacity: 0.865))
                .cornerRadius(10)
            
            TextField("Splunk HTTP Endpoint", text: $HTTPEndpoint)
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
        .padding(.top, 40)
    }
    
    func saveButtonPressed() {
        userDefaults.set(HECToken, forKey: "HECToken")
        userDefaults.set(HTTPEndpoint, forKey: "HTTPEndpoint")
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
