//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import SwiftUI

struct ContentView: View {
   @EnvironmentObject var store: DataStore
    var body: some View {
       TabView {
          EmployeeListView()
             .tabItem { 
                Image(systemName: "person.2.fill")
                   Text("Employees")
             }
          ComponiesListView()
             .tabItem {
                Image(systemName: "briefcase")
                Text("Companies")
             }

       }
    }
}

#Preview {
    ContentView()
      .environmentObject(DataStore())
}
