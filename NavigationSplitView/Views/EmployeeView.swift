//
//  EmployeeView.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-23.
//

import SwiftUI

struct EmployeeView: View {
   @EnvironmentObject var store: DataStore
   var employeeId: Employee.ID?
    var body: some View {
       if let employeeId  {
          if let employee = store.employee(id: employeeId) {
             VStack {
                Text(employee.company.name)
                   .font(.largeTitle)
                Text(employee.fullName)
                   .font(.title)
                Text("\"" + employee.slogan + "\"")
                   .font(.largeTitle)
                   .fontWeight(.thin)
                   .italic()
                   .padding()
                Grid {
                   GridRow(alignment:.top) {
                      Text("Department: ").bold()
                         .gridColumnAlignment(.trailing)
                      Text(employee.department)
                         .gridColumnAlignment(.leading)
                   }
                   GridRow(alignment:.top) {
                      Text("Title: ").bold()
                      Text(employee.title)
                   }
                }
                .padding()
                .border(.primary)
                Spacer()
             }
          }
       } else {
          VStack {
             Image("employee")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
             Text("Selected employee")
                .font(.title)
          }
       }
    }
}

#Preview {
   EmployeeView(employeeId:"92c08f4a-d5bf-49e4-809f-7aefaa155c16")
      .environmentObject(DataStore())
}
