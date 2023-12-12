//
//  StoryView.swift
//  AboutMe
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
       VStack {
          Text("My Story")
             .font(.largeTitle)
             .fontWeight(.bold)
             .padding()
          
          ScrollView {
             Text(information.story)
                .font(.body)
                .padding()
                .border(.green)
          }
       }
       .padding(30)
    }
   
}

#Preview {
    StoryView()
}
