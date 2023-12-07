//
//  EventTaskModel.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import Foundation

struct EventTask: Identifiable, Hashable {
   var id = UUID()
   var text: String
   var isCompleted = false
   var isNew = false
}
