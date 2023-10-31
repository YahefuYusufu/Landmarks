//
//  Uppgift1.swift
//  Pia12V1
//
//  Created by yusufyakuf on 2023-10-31.
//

import SwiftUI

struct Uppgift1: View {
    var body: some View {
        VStack {
            HStack {
                       Color.red
                           .frame(maxWidth: .infinity, maxHeight: 200)
                           .overlay(
                               Text("RED")
                                   .foregroundColor(.white)
                                   .multilineTextAlignment(.center)
                                   .font(.title))
                       
                       Color.blue
                           .frame(maxWidth: .infinity, maxHeight: 200)
                           .overlay(
                               Text("BLUE")
                                   .foregroundColor(.white)
                                   .multilineTextAlignment(.center)
                                   .font(.title))
               }
                      VStack {
                        Text("GREEN")
               }
                                  .foregroundColor(.white)
                                  .frame(width: 400,height: 100)
                                  .background(.green)
                                  .font(.title)
            Spacer()
            
            Color.red
                .frame(width: 200,height: 200)
                .padding(.bottom,0)
                .overlay(
                    Text("CIRCLE")
                        .frame(width: 150,height: 150)
                        .background(.blue)
                        .cornerRadius(100)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.title))
                   }
                        .background(.gray)
                        
   
     }
     
}
    
    


#Preview {
    Uppgift1()
}
