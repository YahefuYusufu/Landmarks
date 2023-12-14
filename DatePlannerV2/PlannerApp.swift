//
//  DatePlannerV2App.swift
//  DatePlannerV2
//
//  Created by yusufyakuf on 2023-11-15.
//

import SwiftUI

@main
struct PlannerApp: App {
   @StateObject private var eventData = EventData()
   
    var body: some Scene {
        WindowGroup {
           NavigationView {
              EventList()
              Text("Select an Event")
                 .foregroundColor(.secondary)
           }
           .environmentObject(eventData)
        }
    }
}
