//
//  LoginView.swift
//  PiaFirebase
//
//  Created by yusufyakuf on 2023-11-23.
//

import SwiftUI
import Firebase

struct LoginView: View {
  @State var email = ""
   @State var password = ""
   var body: some View {
      VStack {
         TextField("Email",text: $email)
         TextField("Password",text: $password)
         
         Button(action: {
            logIn()
         }, label: {
            Text("Login")
         })
         
         Button(action: {
            Register()
         }, label: {
            Text("Register")
            
            
           
         })
      }
   }
   
       func logIn() {
          Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
             
             if error == nil {
                print("login ok")
             } else {
                print("login feild")
             }
          }
       }
       
       func Register() {
          Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
             
             if error == nil {
                print("register ok")
             } else {
                print("register feild")
             }

          }
       }
    
}

#Preview {
    LoginView()
}
