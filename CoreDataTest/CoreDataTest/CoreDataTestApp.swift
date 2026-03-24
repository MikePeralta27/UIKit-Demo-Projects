//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Michael Peralta on 2/2/26.
//

import SwiftUI
import CoreData

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
