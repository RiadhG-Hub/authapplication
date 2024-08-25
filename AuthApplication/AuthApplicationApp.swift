//
//  AuthApplicationApp.swift
//  AuthApplication
//
//  Created by riadh gharbi on 22/8/2024.
//

import SwiftUI
import SwiftData
import SwiftUIRouter

@main
struct AuthApplicationApp: App {
    @StateObject private var authController = AuthViewModel()
    @StateObject private var navigator: Navigator = Navigator()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            Router{
                RootView()
            }
        }
        .modelContainer(sharedModelContainer).environmentObject(authController)
        .environmentObject(navigator)
    }
}
