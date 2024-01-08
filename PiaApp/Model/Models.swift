//
//  Models.swift
//  PiaApp
//
//  Created by yusufyakuf on 2024-01-08.
//

import Foundation

enum MoneyTime {
   case daily,weekly,montly
   
}

class Child {
   var name = ""
   var money = 0
   var getMoney = 0
   var howOften: MoneyTime = .daily
   var inviteCode = ""
   
}

class Parent {
   var name = ""
   
}
