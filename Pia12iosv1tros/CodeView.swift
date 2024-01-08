//
//  CodeView.swift
//  Pia12iosv1tros
//
//  Created by yusufyakuf on 2023-11-02.
//

import SwiftUI

struct CodeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Button(action: {
            displayText()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}

func displayText(){
    let meyText = "hey and welcome here"
    let allWord = meyText.components(separatedBy: " ")
    
    var longestWord = 0
    
    for someWord in allWord {
        if someWord.count > longestWord {
            longestWord = someWord.count
        }
    }
    
    var startRow = ""
    for _ in 1...(longestWord+4) {
        startRow = startRow + "*"
    }
    
    print(longestWord)
    for someWord in allWord {
        var someSpave = " "
        print("* " + someWord + " *")
    }
    print(startRow)
}




#Preview {
    CodeView()
}
