//
//  ProductDetailView.swift
//  PiaIOSAIStod
//
//  Created by yusufyakuf on 2023-11-27.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
       
       Image(systemName: "moon.stars.fill")
          .frame(width: 100,height: 100)
          .font(.largeTitle)
          .foregroundColor(.red)
       
       Button {
          print("edit button was tapped")
       } label: {
          Image(systemName: "pencil")
             .font(.largeTitle)
       }
       
       ScrollView {
          Text("X")
             .padding(.all,50)
          Text("A")
             .padding(.all,50)
          Text("B")
             .padding(.all,50)
          Text("C")
             .padding(.all,50)
          Text("D")
             .padding(.all,50)
       }
       .frame(width: 200,height: 200)
       .background(.gray)
          
    }
}

#Preview {
    ProductDetailView()
}
