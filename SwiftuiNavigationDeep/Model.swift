//
//  Model.swift
//  SwiftuiNavigationDeep
//
//  Created by yusufyakuf on 2023-12-20.
//

import Foundation
import SwiftUI

struct Author: Identifiable,Hashable {
   let name: String
   let numBooks: Int
   let color: Color
   var id: String {
      name
   }
   
   static var sample: [Author] {
      [
         .init(name: "Zordun Sabir", numBooks: 123, color: .red ),
         .init(name: "Abdushkur Adil", numBooks: 321, color: .blue ),
         .init(name: "Adil Kudret", numBooks: 76, color: .black ),
         .init(name: "Yultuz Kasim", numBooks: 23, color: .green ),
      ]
   }
}
