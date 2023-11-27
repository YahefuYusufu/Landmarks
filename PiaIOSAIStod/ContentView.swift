//
//  ContentView.swift
//  PiaIOSAIStod
//
//  Created by yusufyakuf on 2023-11-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
          ProductsView()
             .tabItem {
                Label("Menu",systemImage: "list.dash")
             }
          
          InfoView()
             .tabItem {
                Label("Order",systemImage: "square.and.pencil")
             }
          
          
       }
    }
   
      
}

#Preview {
    ContentView()
}
