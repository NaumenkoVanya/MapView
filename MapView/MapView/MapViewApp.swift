//
//  MapViewApp.swift
//  MapView
//
//  Created by Ваня Науменко on 13.04.23.
//

import SwiftUI

@main
struct MapViewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
