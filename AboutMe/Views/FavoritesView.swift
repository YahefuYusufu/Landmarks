//
//  FavoritesView.swift
//  AboutMe
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
       VStack {
          Text("Favorites")
             .font(.largeTitle)
             .fontWeight(.bold)
             .padding(.bottom, 40)
          
          Text("Hobbies")
             .font(.title2)
          
          HStack {
             ForEach(information.hobbies,id: \.self) { hobby in
                Image(systemName: hobby)
                   .resizable()
                   .scaledToFit()
             }
             .padding()
          }
          .padding()
          
          Text("Foods")
             .font(.title2)
          
          HStack(spacing: 60) {
             ForEach(information.foods, id: \.self) { food in
                Text(food)
                   .font(.title2)
             }
          }
          .padding()
          
          HStack(spacing:30) {
             ForEach(information.colors, id: \.self) { color in
                color
                   .frame(width:70,height: 70)
                   .cornerRadius(10)
             }
          }
          .padding()
       }
    }
}

#Preview {
    FavoritesView()
}
