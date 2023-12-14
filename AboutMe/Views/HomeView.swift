//
//  HomeView.swift
//  AboutMe
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
       VStack {
          Text("yeah!")
             .font(.largeTitle)
             .fontWeight(.heavy)
             .foregroundStyle(.blue)
             .padding()
          Image(information.image)
             .resizable()
             .aspectRatio(contentMode: .fit)
             .cornerRadius(10)
             .padding(40)
          Text(information.name)
             .font(.title)
             .foregroundStyle(.blue)
       }
    }
}

#Preview {
    HomeView()
}
