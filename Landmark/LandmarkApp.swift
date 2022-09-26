//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Amby on 26/09/2022.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
