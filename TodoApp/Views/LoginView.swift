//
//  LoginView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//


import SwiftUI

struct LoginView: View {
   
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Todo List", subTitle: "Do Somethings New", image: "background-5")
                    .padding(.bottom,100)
                //Login Form
              LoginFormView()
                //Create Account
                LoginBottom(title: "Do You Have Account?", titleLink: "Create An Account Here...")
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
