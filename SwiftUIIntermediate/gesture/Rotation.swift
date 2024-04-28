//
//  Rotation.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-20.
//

import SwiftUI

struct Rotation: View {
    var body: some View {
        
        @State var angle: Angle = Angle(degrees: 0)
        
        Text("Rotation Gesture")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    Rotation()
}
