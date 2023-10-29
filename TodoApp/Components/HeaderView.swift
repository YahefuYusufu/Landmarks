//
//  HeaderView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("bacground-3")
                .resizable()
                .scaledToFill()
            VStack {
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text("Get Things Done")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top,30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 300)
    }
}

#Preview {
    HeaderView()
}
