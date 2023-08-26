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
	@StateObject var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
				OnboardingView()
            }
			.environmentObject(locationManager)
			.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
