//
//  ContentView.swift
//  pia12iosNavigation
//
//  Created by yusufyakuf on 2023-11-09.
//

import SwiftUI

struct ContentView: View {
   @State var people = [Person]()
   @State var addTodo = ""
   @State var addLastName = ""
   
   
   var body: some View {
      NavigationStack {
         VStack {
            HStack {
               TextField("Name",text:$addTodo)
               TextField("LastName",text:$addLastName)
               Button(action: {
                  var tempPerson = Person(firstName: addTodo , lastName: addLastName)
                  people.append(tempPerson)
               }, label: {
                  Text("ADD")
               })
            }
            .padding()
            .navigationTitle("personal")
            
            List(people,id: \.self.firstName) { people in
               NavigationLink(
                  destination: PersonDetailView(theName: people),
                  label:  {
                     ListRowView(personNane: people)
                  })
            }
            .listStyle(.automatic)
            
         }
         Spacer()
      }
      //            .onAppear() {
      //                              print("hej")
      //                              var someone = Person(firstName: "adil", lastName: "ekrem")
      //                              print(someone.lastName)
      //            }
   }
}

#Preview {
   ContentView()
}
