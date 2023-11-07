//
//  FunFactsView.swift
//  AboutMe
//
//  Created by yusufyakuf on 2023-11-07.
//

import SwiftUI

struct FunFactsView: View {
   @State private var funFact = "click the button"
   var body: some View {
      VStack{
         Text("Fun Facts")
            .font(.largeTitle)
            .fontWeight(.bold)
         
         Text(funFact)
            .padding()
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: 300,minHeight: 400)
            .background(Color.cyan)
            .foregroundColor(.white)
            .border(Color.gray)
            .cornerRadius(3.0)
         Spacer()
         Button("Show Random Fact") {
            funFact = information.funFacts.randomElement()!
         }
         .padding()
         .foregroundColor(.white)
         .font(.title3)
         .fontWeight(.bold)
         .background(Color.cyan)
         .cornerRadius(15)
      }
      .padding()
  
      
   }
}

#Preview {
   FunFactsView()
}
