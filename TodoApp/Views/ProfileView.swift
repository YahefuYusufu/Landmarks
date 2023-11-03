//
//  ProfileView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile Page")
        }
    }
}

#Preview {
    ProfileView()
}
