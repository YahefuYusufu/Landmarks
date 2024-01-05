//
//  ContentView.swift
//  pia12iosKlockan Watch App
//
//  Created by yusufyakuf on 2024-01-03.
//

import SwiftUI

struct ContentView: View {
   
   @StateObject var peopleApi = PersonAPI()
   var body: some View {
      NavigationStack {
         VStack {
//            Text("Hello, watch!")
//         FuncyBox()
            List {
               ForEach(peopleApi.people ,id:\.firstName) { person in
                  NavigationLink(destination:PersonView(currentPerson: person)) {
                     Text(person.firstName)
                  }
               }
            }
         }
         .padding()
         .onAppear() {
            peopleApi.loadPeople()
         }
      }
   }
}

#Preview {
    ContentView()
}
