//
//  ShowJokeView.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-17.
//

import SwiftUI

struct ShowJokeView: View {
   @Environment (\.dismiss) var dismiss
   @StateObject var bigAPI : ChunkAPI
   
    var body: some View {
       VStack {
          if bigAPI.theJoke != nil {
             Text(bigAPI.theJoke!.value)
                .font(.largeTitle)
          }
          
          Button(action: bigAPI.loadApiRandom, label: {
             Text("Random")
          })
          
          Button(action: {
             dismiss()
          }, label: {
             Text("Close")
          })
       }
    }
}

#Preview {
   ShowJokeView( bigAPI: ChunkAPI())
}
