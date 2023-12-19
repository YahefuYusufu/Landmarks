//
//  TabView1.swift
//  SwiftuiNavigationDeep
//
//  Created by yusufyakuf on 2023-12-19.
//

import SwiftUI

struct TabView1: View {
   let items = ["🍎", "🍐", "🍋", "🍑", "🍌", "🍉", "🍇", "🍒", "🫐", "🍓"]
   
   var body: some View {
      NavigationStack {
         VStack {
            List(items, id: \.self) { item in
               NavigationLink("I choose\(item)", value: item)
            }
            HStack {
               NavigationLink("Button", value: items[9])
               NavigationLink(value:"🍋") {
                  Text("other")
               }
            }
            .buttonStyle(.borderedProminent)
         }
         .padding()
         .navigationTitle("Fruit of the day")
         .navigationDestination(for: String.self) { stringValue in
            ChoosenVIew(item: stringValue)
         }
      }
   }
}

#Preview {
   TabView1()
}

struct ChoosenVIew: View {
   let item: String
   var body: some View {
      Text("You choose \(item)")
   }
}
