//
//  LongGesture.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-20.
//

import SwiftUI

struct LongGesture: View {
    @State var isComplate: Bool = false
    @State var isSuccess: Bool = false
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplate ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
            
            
            HStack {
                Text("Click Here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50) {(isPressing) in
                         //start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplate = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplate = false
                                    }
                                }
                            }
                        }
                    }  perform: {
                        // att the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                Text("Rest")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplate = false
                        isSuccess = false
                    }
            }
        }
   

    }
}

#Preview {
    LongGesture()
}
