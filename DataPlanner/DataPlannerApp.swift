//
//  DataPlannerApp.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import SwiftUI

@main
struct DataPlannerApp: App {
   @StateObject private var eventData = EventData()
    var body: some Scene {
        WindowGroup {
           NavigationView {
             EventListView()
              Text("Select an event")
           }
           .environmentObject(eventData)
        }
    }
}
