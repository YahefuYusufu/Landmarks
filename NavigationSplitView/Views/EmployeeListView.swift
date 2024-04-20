//
//  EmployeeListView.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import SwiftUI

struct EmployeeListView: View {
   @EnvironmentObject var store: DataStore
   @State private var employeeId: Employee.ID?
   
    var body: some View {
        //two coloums option
       NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
          List(store.filteredEmployees,selection: $employeeId) { employee in
             Text(employee.fullName)
                .font(.title)
          }
          .searchable(text: $store.employeeFilter)
          .navigationTitle("Employees")
       } detail: {
          EmployeeView(employeeId: employeeId)
       }
       .navigationSplitViewStyle(.balanced)
    }
      
}

#Preview {
    EmployeeListView()
      .environmentObject(DataStore())
}
