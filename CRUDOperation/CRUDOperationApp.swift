//
//  CRUDOperationApp.swift
//  CRUDOperation
//
//  Created by yusufyakuf on 2023-12-24.
//

import SwiftUI
import SwiftData

@main
struct CRUDOperationApp: App {
   var body: some Scene {
      WindowGroup {
         BookListView()
      }
      .modelContainer(for: Book.self)
   }
   
   init() {
      print(URL.applicationSupportDirectory.path(percentEncoded: false))
   }
}
