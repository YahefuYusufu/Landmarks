//
//  ContentView.swift
//  SwiftuiNavigationDeep
//
//  Created by yusufyakuf on 2023-12-19.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
       TabView {
          TabView1()
             .tabItem {
                Label("Tab1", systemImage:"1.circle.fill")
             }
          TebView2()
             .tabItem {
                Label("Tab2", systemImage: "2.circle.fill")
             }
       }
    }
}

#Preview {
    ContentView()
}
