//
//  ContentView.swift
//  pia12Klockan
//
//  Created by yusufyakuf on 2024-01-03.
//

import SwiftUI

struct ContentView: View {
   
   @StateObject var peopleapi = PersonAPI()
   
   var body: some View {
      NavigationStack {
         VStack {
            Text("Tjena, världen!")
            
            List {
               ForEach(peopleapi.people, id: \.firstName) { person in
                  NavigationLink(destination: Text("ABC")) {
                     Text(person.firstName)
                  }
               }
            }
            
         }
         .padding()
         .onAppear() {
            peopleapi.loadPeople()
         }
      }
   }
}

#Preview {
    ContentView()
}
