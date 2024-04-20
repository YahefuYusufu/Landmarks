//
//  MagnificationGesture.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-20.
//

import SwiftUI

struct Magnification: View {
    
    @State var amount: CGFloat = 0
    
    var body: some View {
        Text("Hello, World")
            .font(.title)
            .padding(40)
            .foregroundColor(.white)
            .background(Color.green.cornerRadius(10))
            .scaleEffect(1 + amount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        amount = value - 1
                    }
            )
    }
}

#Preview {
    Magnification()
}
