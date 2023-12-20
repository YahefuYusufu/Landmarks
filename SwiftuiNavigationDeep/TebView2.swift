//
//  TebView2.swift
//  SwiftuiNavigationDeep
//
//  Created by yusufyakuf on 2023-12-19.
//

import SwiftUI

struct TebView2: View {
   @State private var path = NavigationPath()
   var body: some View {
       NavigationStack(path: $path) {
             VStack {
                NavigationLink(Author.sample[0].name, value: Author.sample[0].name)
                NavigationLink(Author.sample[1].name, value: Author.sample[1].numBooks)
                NavigationLink(Author.sample[2].name, value: Author.sample[2].color)
                NavigationLink(Author.sample[3].name, value: Author.sample[3])
                Button("random") {
                   let randomAuthor = Author.sample.randomElement()!
                   path.append(randomAuthor)
                }
             }
             .navigationTitle("Tab 2")
             .buttonStyle(.bordered)
             .navigationDestination(for: String.self) { stringValue in
                Text(stringValue).font(.largeTitle)
             }
             .navigationDestination(for: Int.self) { intValue in
                Text("\(intValue) books").font(.largeTitle)
             }
             .navigationDestination(for: Color.self) { colorValue in
                colorValue
             }
             .navigationDestination(for: Author.self) { autherValue in
                ZStack {
                   autherValue.color
                   VStack{
                      Text(autherValue.name)
                         .foregroundStyle(.white)
                      Text("\(autherValue.numBooks) books")
                         .foregroundStyle(.white)
                         .bold()
                   }
                }
             }
          }
    }
}

#Preview {
    TebView2()
}


