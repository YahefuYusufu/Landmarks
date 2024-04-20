//
//  ContentView.swift
//  pia12IOSTV
//
//  Created by yusufyakuf on 2024-01-03.
//

import SwiftUI

struct ContentView: View {
   @StateObject var peopleApi = PersonAPI()
   
   @State var myText = ""
   var body: some View {
      NavigationStack {
         VStack {
            Text("Hello, watch!")
            FuncyBox()
            
            HStack {
               TextField("text", text: $myText)
               Button("Button") {
                  
               }
            }
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
