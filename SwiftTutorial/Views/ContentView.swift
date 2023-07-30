//
//  ContentView.swift
//  SwiftTutorial
//
//  Created by yusufyakuf on 2023-07-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyVStack {
            MapView().ignoresSafeArea(edges: .top).frame(height: 350)
            
            CircleImage().offset(y:-210).padding(.bottom,-120)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock").font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }.font(.subheadline)
                    .foregroundColor(.secondary)
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
        .padding()
            
        Spacer()
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
