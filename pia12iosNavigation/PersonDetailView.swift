//
//  PersonDetailView.swift
//  pia12iosNavigation
//
//  Created by yusufyakuf on 2023-11-09.
//

import SwiftUI

struct PersonDetailView: View {
   @Environment(\.dismiss) var dismiss
   @State var theName : Person
   @State var PName = ""
   
   var body: some View {
      VStack {
         
         Text("more about: " + theName.firstName)
         TextField("", text: $PName)
         Button(action: {
            dismiss()
         }, label: {
            Text("Save")
         })
         
         NavigationLink(destination: ThirdView(), label: {
            Text("go back")
         })
         .onAppear() {
            PName = theName.firstName
         }
      }
   }
}

#Preview {
   PersonDetailView(theName: Person.init(firstName: "abc", lastName: "xyz"))
}
