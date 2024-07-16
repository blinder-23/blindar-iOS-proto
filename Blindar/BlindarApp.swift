//
//  BlindarApp.swift
//  Blindar
//
//  Created by Suji Lee on 5/30/24.
//

import SwiftUI
import SwiftData

//let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""

@main
struct BlindarApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserData.self,
            MealLocalData.self,
            ScheduleData.self,
            SchoolLocalData.self,
            MemoLocalData.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
