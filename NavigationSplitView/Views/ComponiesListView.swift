//
//  ComponiesListView.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import SwiftUI

struct ComponiesListView: View {
   @EnvironmentObject var store: DataStore
   @State private var companyId: Company.ID?
   @State private var employeeId: Employee.ID?
   @State private var columnVisibility: NavigationSplitViewVisibility = .all
   
   var body: some View {
      NavigationSplitView(columnVisibility: $columnVisibility) {
         List(store.companies,selection: $companyId) {company in
            Text(company.name)
               .font(.title)
         }
         .navigationTitle("Companies")
         .font(.largeTitle)
      } content: {
         if companyId == nil {
            VStack {
               Image("company")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 300)
               Text("Selected Company")
                  .font(.title)
            }
            .padding()
         } else {
            if let company = store.company(id: companyId!) {
               List(company.employees,selection:$employeeId) { employee in
                  Text(employee.fullName)
               }
            }
         }
         
      } detail: {
         EmployeeView(employeeId: employeeId)
      }
      .navigationSplitViewStyle(.balanced)
      .onChange(of: companyId) {
          //
      }
      .onChange(of: employeeId) {
         if employeeId == nil {
            columnVisibility = .all
         } else {
            columnVisibility = .doubleColumn
         }
         
         
      }
   }
}

#Preview {
   ComponiesListView()
      .environmentObject(DataStore())
}
