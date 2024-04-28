//
//  HashableT.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-28.
//

import SwiftUI


//IDENTIFIABLE AND HASHABLE ALMOST SAME

struct MyCustomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}


struct HashableT: View {
    let data: [MyCustomModel] = [
     MyCustomModel(title: "One"),
     MyCustomModel(title: "Two"),
     MyCustomModel(title: "Three"),
     MyCustomModel(title: "Four"),
     MyCustomModel(title: "Five"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                
                ForEach(data) {item in
                    Text(item.title)
                        .font(.callout)
                }
                
                
//                ForEach(data, id: \.self) {item in
//                    Text(item)
//                        .font(.headline)
//                }
            }
        }
    }
}

#Preview {
    HashableT()
}
