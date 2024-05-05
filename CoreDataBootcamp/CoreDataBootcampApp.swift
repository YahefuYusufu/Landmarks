//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by prg on 2024-04-28.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
