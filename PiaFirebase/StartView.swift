//
//  StartView.swift
//  PiaFirebase
//
//  Created by yusufyakuf on 2023-11-23.
//

import SwiftUI
import Firebase

struct StartView: View {
   
   @State var isLoggedIn = false
   
   var body: some View {
      VStack{
         if isLoggedIn {
            ContentView()
         } else {
            LoginView()
         }
      }
      .onAppear() {
         _ = Auth.auth().addStateDidChangeListener { auth, user in
           if Auth.auth().currentUser == nil {
              isLoggedIn = false
           } else {
              isLoggedIn = true
              print(Auth.auth().currentUser?.uid as Any)
           }
         }
        
      }
   }
}

#Preview {
    StartView()
}
