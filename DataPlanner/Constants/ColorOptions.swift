//
//  ColorOptions.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import SwiftUI

struct ColorOptions {
   
   static func random() -> Color {
      if let element = ColorOptions.all.randomElement() {
         return element
      } else {
         return.primary
      }
   }
   static var `default` : Color = Color.primary
   
   static var all: [Color] = [
      .primary,
      .gray,
      .red,
      .orange,
      .yellow,
      .green,
      .mint,
      .cyan,
      .indigo,
      .purple,
   ]
}
