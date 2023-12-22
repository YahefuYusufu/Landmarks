//
//  DataStore.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import Foundation

class DataStore:ObservableObject {
   @Published var companies: [Company] = []
   @Published var employees: [Employee] = []
   
   init() {
      loadData()
   }
   
   func loadData() {
      let json = Bundle.main.decode([CompanyJSON].self, from: "MOCK_DATA")
      for company in json {
         let newCompany = Company(id: company.id, name: company.name)
         for employee in company.Emplpyee{
            let newEmployee = Employee(id: employee.id,
                                       firstName: employee.firstName,
                                       lastName: employee.lastName,
                                       department: employee.department,
                                       slogan: employee.slagon,
                                       title: employee.title,
                                       company: newCompany)
            employees.append(newEmployee)
            companies.append(newCompany)
         }
      
      }
      companies = companies.sorted(using: KeyPathComparator(\.name))
      employees = employees.sorted(using: KeyPathComparator(\.lastName))
   }
   
   func employee(id: String) -> Employee? {
      employees.first(where: {$0.id == id})
   }
   
   func company(id: String) -> Company? {
      companies.first(where: {$0.id == id})
   }
}
