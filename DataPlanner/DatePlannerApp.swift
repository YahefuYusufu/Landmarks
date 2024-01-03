//
//  DataPlannerApp.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import SwiftUI

@main
struct DatePlannerApp: App {
   @StateObject private var eventData = EventData()
   var body: some Scene {
      WindowGroup {
         NavigationView {
            EventList()
            Text("Select an Event")
               .foregroundStyle(.secondary)
         }
         .environmentObject(eventData)
         
      }
   }
}
