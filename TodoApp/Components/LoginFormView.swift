//
//  FormView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct LoginFormView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
      
        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            }
            TextField("Email Address",
                      text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Password",
                        text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
            TLButton(
                     title: "Log In",
                     background: .blue
            ){
                viewModel.login()
            }
            .padding()
        }
    }
}

#Preview {
    LoginFormView()
}
