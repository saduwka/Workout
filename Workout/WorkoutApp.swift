//
//  WorkoutApp.swift
//  Workout
//
//  Created by Nurzhan on 25.05.2026.
//

import SwiftUI
import SwiftData

@main
struct WorkoutApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [Workout.self, Exercise.self])
    }
}
