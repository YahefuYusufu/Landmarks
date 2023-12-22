//
//  ComponiesListView.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import SwiftUI

struct ComponiesListView: View {
   @EnvironmentObject var store: DataStore
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ComponiesListView()
      .environmentObject(DataStore())
}
