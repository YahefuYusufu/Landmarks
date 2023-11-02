//
//  ContentView.swift
//  Pia12iosv1tros
//
//  Created by yusufyakuf on 2023-11-02.
//

import SwiftUI

struct ContentView: View {
    @State var resultNumber = 0
    @State var inputNumber = ""
    var body: some View {
        VStack {
            Text(String(resultNumber))
                .font(.title)
            TextField("Write nuber", text: $inputNumber)
            HStack {
                Button(action: {
                    doCalc(count: "Plus")
                }, label: {
                    Text("Plus")
                })
                Button(action: {
                    doCalc(count: "Minus")
                }, label: {
                    Text("Minus")
                })
                Button(action: {
                    doCalc(count: "Multi")
                }, label: {
                    Text("Multi")
                })
            }
            Spacer()
            Button(action: {
                doCalc(count: "Reset")
            }, label: {
                Text("Reset")
            })
        }
        .padding()
    }
    
    func doCalc(count: String){
        let numbers = ["one","two","three","four","five"]
        if let findNumber = numbers.firstIndex(where: { $0 == inputNumber}) {
            if count == "Plus" {
                resultNumber += findNumber
            }
            if count == "Minus" {
                resultNumber -= findNumber
            }
            if count == "Minus" {
                resultNumber = resultNumber * findNumber
            }

        }
        
        var textNumber = 0
        if inputNumber.lowercased() == "one" {
            textNumber = 1
        }
        if inputNumber.lowercased() == "two" {
            textNumber = 2
        }
        if inputNumber.lowercased() == "three" {
            textNumber = 3
        }
        if count == "Plus" {
            resultNumber += textNumber
        }
        if count == "Minus" {
            resultNumber -= textNumber
        }
        if count == "Plus" {
            if let funNumber = Int(inputNumber) {
                resultNumber += funNumber
            }
        }
        if count == "Multi" {
            resultNumber = resultNumber * textNumber
        }

        
        //                if Int(inputNumber) != nil {
        //                    resultNumber =
        //                    resultNumber +
        //                    Int(inputNumber)!
        //                }
        
    }
}

#Preview {
    ContentView()
}
