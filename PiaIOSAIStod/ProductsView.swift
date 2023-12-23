//
//  PruductsView.swift
//  PiaIOSAIStod
//
//  Created by yusufyakuf on 2023-11-27.
//

import SwiftUI

struct ProductsView: View {
   var body: some View {
      NavigationStack {
         ScrollView(.vertical) {
            VStack {
               Text("Aplisen")
                  .padding(.all,50)
               Text("Apple")
                  .padding(.all,50)
               Text("Kivi")
                  .padding(.all,50)
               
               NavigationLink("More") {
                  ProductDetailView()
               }
               VStack {
                  
               }
               .frame(width: 100,height: 400)
               .background(.green)
               VStack {
                  
               }
               .frame(width: 200,height: 400)
               .background(.blue)
            }
            .frame(maxWidth: .infinity)
         }
         
      }
   }
}

#Preview {
    ProductsView()
}
