//
//  ContentView.swift
//  AboutMe
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
       TabView {
          HomeView()
             .tabItem {
                Label("Home",systemImage: "person")
             }
          
          StoryView()
             .tabItem {
                Label("Story",systemImage: "book")
             }
          
          FavoritesView()
             .tabItem {
                Label("Favorites",systemImage: "star")
             }
          
          FunFactsView()
             .tabItem {
                Label("Fun Facts",systemImage: "hand.thumbsup")
             }
       }
    }
}

#Preview {
    MainView()
}
