//
//  ListRow.swift
//  pia12iosNavigation
//
//  Created by yusufyakuf on 2023-11-09.
//

import SwiftUI

struct ListRowView: View {
   @State var personNane : Person
    var body: some View {
       HStack{
        Text("name is: ")
          Spacer()
          Text(personNane.firstName)
          Text(personNane.lastName)
       }
       .frame(height:80)
       .background(Color.yellow)
    }
}

#Preview {
   ListRowView(personNane: Person(firstName: "test person", lastName: "test son"))
}
