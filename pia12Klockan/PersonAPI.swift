//
//  PersonAPI.swift
//  pia12Klockan
//
//  Created by yusufyakuf on 2024-01-03.
//

import Foundation

class Person {
   var firstName = ""
   var lastName = ""
}

class PersonAPI: ObservableObject {
   
   @Published var people = [Person]()
   
   func loadPeople() {
      var tempPeople = [Person]()
      
      let p1 = Person()
      p1.firstName = "Kudret"
      p1.lastName = "Tursun"
      tempPeople.append(p1)
      
      let p2 = Person()
      p2.firstName = "Adam"
      p2.lastName = "Anderson"
      tempPeople.append(p2)
      
      people = tempPeople
      
   }
}
