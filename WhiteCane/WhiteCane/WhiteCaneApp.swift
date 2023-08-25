//
//  WhiteCaneApp.swift
//  WhiteCane
//
//  Created by Junyoo on 2023/08/25.
//

import SwiftUI

@main
struct WhiteCaneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                OnboardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
