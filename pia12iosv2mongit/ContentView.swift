//
//  ContentView.swift
//  pia12iosv2mongit
//
//  Created by yusufyakuf on 2023-11-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
           Text("Hello, twice")
           Text("firstBranch")
        }
        .padding()
    }
   func dofunnyStuff() {
      print("fun")
   }
   func dofunnyStuff2() {
      print("fun2")
   }
}

#Preview {
    ContentView()
}
