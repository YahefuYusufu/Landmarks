//
//  LoginBottom.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct LoginBottom: View {
    let title: String
    let titleLink: String
    
    var body: some View {
        VStack {
            Text(title)
            NavigationLink(titleLink,
                           destination:RegisterView())
        }
        
    }
}

#Preview {
    LoginBottom(title: "", titleLink: "")
}
