//
//  Item.swift
//  PiaCoreData
//
//  Created by yusufyakuf on 2023-12-07.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
class Todo {
   var title: String
   var done : Bool
   
   var subSteps: [SubStuff]
   
   init(title: String) {
      self.title = title
      self.done = false
      
      subSteps = [SubStuff]()
   }
}

@Model
class SubStuff {
   var subName: String
   var done: Bool
   
   init(subName: String) {
      self.subName = subName
      self.done = false
   }
}
