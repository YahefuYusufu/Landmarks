//
//  ProfileView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI
import UIKit

struct ProfileView: View {
   @StateObject var viewModel = ProfileViewViewModel()
   
   var body: some View {
      NavigationView {
         VStack {
            if let user = viewModel.user {
               profile(user: user)
            } else {
               ProgressView()
                  .progressViewStyle(CircularProgressViewStyle(tint: .blue))
               Text("Loading Profile ...")
            }
         }
         .navigationTitle("Profile")
      }
      .onAppear {
         viewModel.fetchUser()
      }
   }
   
   @ViewBuilder
   func profile(user: User) -> some View {
      //Avatar
      Image(systemName: "person.circle")
         .resizable()
         .aspectRatio(contentMode: .fit)
         .foregroundColor(.blue)
         .frame(width: 125,height: 125)
         .padding()
      //user info(name,email,member since)
      VStack {
         HStack {
            Text("Name: ")
               .bold()
            Text(user.name)
         }
         .padding()
         HStack {
            Text("Email: ")
               .bold()
            Text(user.email)
         }
         .padding()
         HStack {
            Text("Member since: ")
               .bold()
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
         }
         .padding()
      }
      .padding()
      //Sing out
      Button("Log Out") {
         viewModel.logOut()
      }
      .tint(.red)
      .padding()
      Spacer()
   }
}

#Preview {
   ProfileView()
}
