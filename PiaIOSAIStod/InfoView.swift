//
//  InfoView.swift
//  PiaIOSAIStod
//
//  Created by yusufyakuf on 2023-11-27.
//

import SwiftUI

struct InfoView: View {
   @State var number = 0
   var body: some View {
      NavigationStack {
         GeometryReader { geometry in
            VStack {
               Text("Massa Info om fruktbolaget")
               
               Text(String(number))
               
               Button(action: {
                  number = number + 1
               }, label: {
                  Text("increase")
               })
               
               NavigationLink("more") {
                  Text("ABC")
               }
               
               HStack(spacing: 0) {
                  Text("Left")
                     .font(.largeTitle)
                     .foregroundStyle(.black)
                     .frame(width: geometry.size.width * 0.33)
                     .background(.yellow)
                  Text("Right")
                     .font(.largeTitle)
                     .foregroundStyle(.black)
                     .frame(width: geometry.size.width * 0.67)
                     .background(.orange)
               }
               
               VStack {
                  
               }
               .frame(width: geometry.size.width,height: geometry.size.height)
               .background(.cyan)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
         }
      }
   }
}

#Preview {
    InfoView()
}
