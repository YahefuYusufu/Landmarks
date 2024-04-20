//
//  ContentView.swift
//  PiaApp
//
//  Created by yusufyakuf on 2024-01-08.
//

import SwiftUI

struct MainView: View {
   @StateObject var apiHelp = APIHelper.shared
   
    var body: some View {
       VStack {
          if apiHelp.loggedInParent == nil {
             LoginView()
          } else {
             ChildrenListView()
          }
       }
       .onAppear() {
          apiHelp.checkLogin()
       }
    }
}

#Preview {
    MainView()
}
