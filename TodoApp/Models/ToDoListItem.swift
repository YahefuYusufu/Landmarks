//
//  ToDoListItem.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
   let id: String
   let title: String
   let dueDate: TimeInterval
   let createDate: TimeInterval
   var isDone: Bool
   
   mutating func setDone(_ state: Bool) {
      isDone = state
   }
}

