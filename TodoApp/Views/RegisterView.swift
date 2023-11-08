//
//  RegisterView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Get Accound Here", image: "background-6")
                .padding(.bottom,100)
            RegisterFormView()
        }
    }
}

#Preview {
    RegisterView()
}
