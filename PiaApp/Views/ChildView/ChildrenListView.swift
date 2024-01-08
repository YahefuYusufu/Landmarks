//
//  ChildrenListView.swift
//  PiaApp
//
//  Created by yusufyakuf on 2024-01-08.
//

import SwiftUI

struct ChildrenListView: View {
   @StateObject var apiHelp = APIHelper.shared

    var body: some View {
       NavigationStack {
          
          NavigationLink(destination: ViewChildView()) {
             Text("View child!")
          }
          NavigationLink(destination: AddChildView()) {
             Text("ADd child!")
          }
          NavigationLink(destination: AddParenView()) {
             Text("ADd parent!")
          }
          Spacer()
          
          Button("Log Out") {
             apiHelp.logOut()
          }
       }
       .navigationTitle("Child List")
    }
}

#Preview {
    ChildrenListView()
}
