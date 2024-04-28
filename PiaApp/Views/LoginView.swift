//
//  LoginView.swift
//  PiaApp
//
//  Created by yusufyakuf on 2024-01-08.
//

import SwiftUI

struct LoginView: View {
   @StateObject var apiHelp = APIHelper.shared
   
   @State var email = ""
   @State var password = ""
   
    var body: some View {
       VStack {
          TextField("Email",text: $email)
          TextField("Password",text: $password)
          
          Button("Login In") {
             apiHelp.login(email: email, password: password)
          }
       }
    }
}

#Preview {
    LoginView()
}
