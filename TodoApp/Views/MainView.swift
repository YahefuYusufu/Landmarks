//
//  ContentView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            //signed In
           accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserID)
                .tabItem {
                    Label ( "Home",systemImage:"house")
                }
            ProfileView()
                .tabItem {
                    Label ("Profile",systemImage:"person.circle")
                }
        }
    }
    
}

#Preview {
    MainView()
}
