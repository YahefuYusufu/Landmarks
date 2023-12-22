//
//  JSONModels.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import Foundation

struct CompanyJSON: Codable, Identifiable {
   var name: String
   var id: String
   var Emplpyee: [Employee]
   
   struct Employee:Codable, Identifiable, Hashable {
      let id: String
      var firstName: String
      var lastName: String
      var title: String
      var department: String
      var slagon: String
      
      var fullName: String {
         
         firstName + "" + lastName
      }
   }
}
