//
//  APIHelper.swift
//  PiaApp
//
//  Created by yusufyakuf on 2024-01-08.
//

import Foundation

class APIHelper: ObservableObject {
   
   static let shared = APIHelper()
   
   @Published var loggedInParent: Parent?
   @Published var children:  [Child]?
   
   func checkLogin() {
      if UserDefaults.standard.string(forKey: "session") != nil {
         /**
          load: /parent
          */
         let tempParent = Parent()
         tempParent.name = "ABC"
         loggedInParent = tempParent
      } else {
         
      }
   }
   
   func logOut() {
      UserDefaults.standard.removeObject(forKey: "session")
      loggedInParent = nil
   }
   
   func login(email: String, password: String) {
      
      /**
       load/ login
       Skickat:{email: "AA" , password: "BB"}
       
       got svar :
       {
          session:"XYZ123",
          paremt:{
          name:"Torsten"
         }
       }
       */
      
      UserDefaults.standard.setValue("XYZ123", forKey: "session")
      let tempParent = Parent()
      tempParent.name = "ABC"
      
      loggedInParent = tempParent
   }
   func register() {
      
   }
   func loadChildren() {
      /**
       load: /load children
         send with session
       */
      var tempChildren = [Child]()
      var c1 = Child()
      c1.name = "Arne"
      c1.money = 12
      c1.getMoney = 5
      c1.howOften = .weekly
      c1.inviteCode = "ABC"
      tempChildren.append(c1)
      
      var c2 = Child()
      c1.name = "Bertil"
      c1.money = 1233
      c1.getMoney = 39
      c1.howOften = .daily
      c1.inviteCode = "XYZ"
      tempChildren.append(c2)
      
      children = tempChildren
   }
   
   func addChild() {
      
   }
}
