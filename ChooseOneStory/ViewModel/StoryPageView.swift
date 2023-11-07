//
//  StoryPageView.swift
//  ChooseOneStory
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct StoryPageView: View {
   let story: Story
   let pageIndex: Int
    var body: some View {
       VStack {
          ScrollView {
             Text(story[pageIndex].text)
          }
          ForEach(story[pageIndex].choices,id: \Choice.text) { choice in
             NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                Text(choice.text)
                   .multilineTextAlignment(.center)
                   .frame(maxWidth: .infinity, alignment: .leading)
                   .padding()
                   .background(Color.gray.opacity(0.25))
                   .cornerRadius(8)
             }
          }
       }
       .padding()
       .navigationTitle("Page \(pageIndex + 1)")
       .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
   StoryPageView(story: story, pageIndex: 0)
}
