//
//  PiaPurchaseApp.swift
//  PiaPurchase
//
//  Created by yusufyakuf on 2023-12-11.
//

import SwiftUI

@main
struct PiaPurchaseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
