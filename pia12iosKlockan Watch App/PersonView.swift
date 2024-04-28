//
//  PersonView.swift
//  pia12iosKlockan Watch App
//
//  Created by yusufyakuf on 2024-01-03.
//

import SwiftUI

struct PersonView: View {
   @State var currentPerson: Person
    var body: some View {
       Text(currentPerson.firstName)
       Text(currentPerson.lastName)
    }
}

#Preview {
   PersonView(currentPerson: Person())
}
