//
//  HeaderView.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-29.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let image: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .rotationEffect(.degrees(20))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top,30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,height: 300)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "SubTitle", image: "Image")
}
