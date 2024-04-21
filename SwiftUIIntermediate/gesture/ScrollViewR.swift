//
//  ScrollViewR.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-21.
//

import SwiftUI

struct ScrollViewR: View {

    var body: some View {
        VStack {
           
            Button("SCROLL now") {
              
//                    proxy.scrollTo(30,anchor: .center)
                }
            }
            
            ScrollView {
                    ScrollViewReader { proxy in
                    
                    ForEach(0..<50) { index in
                        VStack {
                            Text("This is item: \(index)")
                                .font(.headline)
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding()
                                .id(index)
                        }
                     }
                }
            }
        }
        
    }
        


#Preview {
    ScrollViewR()
}
