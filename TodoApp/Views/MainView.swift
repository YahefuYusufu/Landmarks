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
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
