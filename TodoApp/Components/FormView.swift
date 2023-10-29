//
//  FormView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct FormView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        Form {
            TextField("Email Address",text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password",text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
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
        }
    }
}

#Preview {
    FormView()
}
