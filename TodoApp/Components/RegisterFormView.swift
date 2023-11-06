//
//  RegisterFormView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct RegisterFormView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        Form {
            TextField("Full Name", text:$viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            TextField("Email Address", text:$viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            SecureField("Password", text:$viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButton(title: "Create Account", background: .green){
                //Action
                viewModel.register()
            }
            .padding()
        }
         
    }
}

#Preview {
    RegisterFormView()
}
