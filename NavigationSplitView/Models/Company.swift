//
//  Company.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import Foundation

struct Company: Identifiable {
   var id: String
   var name: String
   var employee: [Employee] = []
}
