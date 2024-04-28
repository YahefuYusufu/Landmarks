//
//  CompanyView.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-23.
//

import SwiftUI

struct CompanyView: View {
   @EnvironmentObject var store: DataStore
   
    var body: some View {
       //three column navigation split view
       NavigationSplitView {
          
       } content: {
          
       
       } detail: {
           
       }

    }
}

#Preview {
    CompanyView()
      .environmentObject(DataStore())
}
