//
//  MoreView.swift
//  PiaIOSAIStod
//
//  Created by yusufyakuf on 2023-11-27.
//

import SwiftUI

struct MoreView: View {
   @State var isNice = 0
   
    var body: some View {
       VStack {
          Text("Banan")
          Button(action: {
             isNice += 1
          }, label: {
             Text("oka")
          })
          
          Text("hej")
             .modifier(niceBlue())
          
          HStack {
             
          }
          .frame(width: 100,height: 100)
          .modifier(niceBlue())
       }
       .frame(width: 200,height: 200)
       .background(doTheColor())
        
    }
   
   func doTheColor() -> Color {
      if isNice > 10 {
         return .yellow
      }
      if isNice > 5 {
         return .blue
      }
      return .red
   }
}

#Preview {
    MoreView()
}

struct niceBlue: ViewModifier {
   func body(content: Content) -> some View {
      content
         .background(.blue)
   }
}
