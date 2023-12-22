//
//  NavigationSplitViewApp.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import SwiftUI

@main
struct NavigationSplitViewApp: App {
   @StateObject var store = DataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(store)
        }
    }
}
