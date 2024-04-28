//
//  Mask.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-21.
//

import SwiftUI

struct Mask: View {
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starView
                .overlay(overlayView.mask(starView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader {geometry in
            ZStack(alignment: .leading) {
                Rectangle()
//                    .foregroundColor(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    private var starView: some View {
        HStack {
            ForEach(1..<6) { index in
            Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    Mask()
}
