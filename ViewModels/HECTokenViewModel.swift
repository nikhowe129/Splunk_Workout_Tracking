//
//  HECTokenViewModel.swift
//  Splunk_Workout_Tracking
//
//  Created by Nik Howe on 14/9/2022.
//

import Foundation

class HECTokenViewModel: ObservableObject {
    
    @Published var HECToken: HECTokenModel = HECTokenModel(HECToken: "") {
        didSet {
            saveHECToken()
        }
    }
    
    let tokenKey: String = "HEC_Token"
    
    init() {
        getHECToken()
    }
    
    func getHECToken() {
        guard
            let data = UserDefaults.standard.data(forKey: tokenKey),
            let savedHECToken = try? JSONDecoder().decode(HECTokenModel.self, from: data)
        else { return }
        
        self.HECToken = savedHECToken
    }
    
    func saveHECToken() {
        if let encodedData = try? JSONEncoder().encode(HECToken) {
            UserDefaults.standard.set(encodedData, forKey: tokenKey)
        }
    }
    
}
