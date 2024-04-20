//
//  MagnificationGesture.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-20.
//

import SwiftUI

struct Magnification: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
        HStack {
            Circle().frame(width: 35, height: 35)
            Text("Swiftful Thinking")
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(.horizontal)
            Rectangle().frame(height:300).scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                            currentAmount = 0
                            }
                        }
                )
        HStack {
            Image(systemName: "heart.fill")
            Image(systemName: "text.bubble.fill")
            Spacer()
        }
        .padding(.horizontal)
        .font(.headline)
        Text("This is the caption for my photo")
            .frame(maxWidth: .infinity,alignment: .leading).padding(.horizontal)
        }
//        Text("Hello, World")
//            .font(.title)
//            .padding(40)
//            .foregroundColor(.white)
//            .background(Color.green.cornerRadius(10))
//            .scaleEffect(1 + amount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        amount = value - 1
//                    }
//                    .onEnded { value in
//                     lastAmount += amount
//                        amount = 0
//                    }
//            )
    }
}

#Preview {
    Magnification()
}
