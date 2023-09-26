//
//  ContentView.swift
//  WeatherApp
//
//  Created by yusufyakuf on 2023-09-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue,.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
            }
        Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
    }
}

#Preview {
    ContentView()
}
