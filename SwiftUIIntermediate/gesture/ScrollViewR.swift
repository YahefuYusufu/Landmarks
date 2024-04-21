//
//  ScrollViewR.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-21.
//

import SwiftUI

struct ScrollViewR: View {

    var body: some View {
        @State var scrollToIndex: Int = 0
        @State var textFieldText: String = ""
        VStack {
            TextField("Emter a # here.... ", text: $textFieldText)
                .frame(height: 45)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            Button("SCROLL now") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
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
                        .onChange(of: scrollToIndex) {old,new in
                            proxy.scrollTo(new,anchor: .top)
                        }
                    }
                }
            }
        }
        
    }
        
}

#Preview {
    ScrollViewR()
}
