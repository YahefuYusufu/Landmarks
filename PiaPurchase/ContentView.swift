//
//  ContentView.swift
//  PiaPurchase
//
//  Created by yusufyakuf on 2023-12-11.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    

    var body: some View {
       VStack {
          Text("Welcome to my store")
             .font(.title)
       
          ProductView(id: "PurchasPia") {
             Image(systemName: "crown")
          }
          .productViewStyle(.compact)
          .padding()
          }
     }
}
 

#Preview {
   ContentView()
}


