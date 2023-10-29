//
//  FormView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct LoginFormView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        Form {
            TextField("Email Address",text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Password",text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            Button {
                // Attempt log in
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                    
                Text("Log In")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginFormView()
}
