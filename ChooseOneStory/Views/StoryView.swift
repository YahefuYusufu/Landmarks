//
//  StoryView.swift
//  ChooseOneStory
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
       NavigationStack {
          NavigationStack {
             StoryPageView(story: story, pageIndex: 0)
          }
       }
    }
}

#Preview {
    StoryView()
}
