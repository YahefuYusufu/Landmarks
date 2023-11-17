//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI
import FirebaseCore

@main
struct TodoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
