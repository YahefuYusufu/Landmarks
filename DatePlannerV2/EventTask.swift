//
//  EventTask.swift
//  DatePlannerV2
//
//  Created by yusufyakuf on 2023-11-15.
//

import Foundation
//An event task represents a to-do item for an event. Here, you’ll learn how how to model the tasks.

struct EventTask: Identifiable, Hashable {
//   EventTask contains properties for text, completion state, and an isNew property.
   var id = UUID()
   var text: String
   var isCompleted = false
   var isNew = false
}
