//
//  ContentView.swift
//  Pia12V1
//
//  Created by yusufyakuf on 2023-10-30.
//

import SwiftUI

struct MainView: View {
    @State var funText = "hey"
    @State var myNumber = 0
    @State var myInput = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(funText)
                .font(.largeTitle)
                .frame(width: 100,height: 100)
                .background(.pink)
                .cornerRadius(15)
            
            Text(String(myNumber))
            if myNumber > 5 {
                Text("There is big number  ")
                    .font(.title)
            }
            
            Button("Click here") {
             something()
                
                print(myInput)
                myInput = "kivi"
            }
            HStack {
                Spacer()
                Text("A")
                Spacer()
                Text("B")
                Spacer()
                Text("C")
                Spacer()
            }
            SecontView()
            SecontView()
            
            TextField("userName",text: $myInput)
            Spacer()
            Text("bottom")
                
        }
        .padding()
    }
    func something(){
        funText = "Banan"
        myNumber += 1
        print(myNumber)
    }
}

#Preview {
    MainView()
}
