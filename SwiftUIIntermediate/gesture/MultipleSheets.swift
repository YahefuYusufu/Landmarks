//
//  MultipleSheets.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-21.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

//1 - use a binding
//2 - use multiple ..sheets
//3 = use $item

struct MultipleSheets: View {
    @State var slectedModel: RandomModel? = nil
  
    var body: some View {
        ScrollView {
            
        
        VStack(spacing: 20) {
            ForEach(0..<50) {index in
                Button("Button \(index)") {
                    slectedModel = RandomModel(title: "\(index)")
                }
            }
            
        
            
        }
        .sheet(item: $slectedModel) { model in
            NextScreen(selectedModel: model)
            
        }
        }

    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}
#Preview {
    MultipleSheets()
}
