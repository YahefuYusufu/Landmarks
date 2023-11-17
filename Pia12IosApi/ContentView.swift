//
//  ContentView.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-13.
//

import SwiftUI

struct ContentView: View {
   @StateObject var fakeAPI = ChunkAPI()
   @State var searchText = ""
   
   var body: some View {
      VStack {
         
         if fakeAPI.theJoke != nil {
            Text(fakeAPI.theJoke!.created_at)
            Text(fakeAPI.theJoke!.value)
         }
         
         HStack {
            TextField("Search Joke.....",text: $searchText)
               .border(Color.black)
            
            
            Button(action: {
               Task {
                  await fakeAPI.loadApiForSearch(jokeSearch:searchText)
               }
            }, label: {
               Text("Search")
            })
         }
         Button(action: {
            Task {
               await fakeAPI.loadApi()
            }
         }, label: {
            Text("Random Joke")
         })
         
         List {
            ForEach(fakeAPI.jokeCategories,id: \.self) { cat in
               Button(action: {
                  Task {
                     await  fakeAPI.loadApiForCategory(jokeCat: cat)
                  }
               }, label: {
                  Text(cat)
               })
            }
         }
      }
      .padding()
      .onAppear() {
         Task {
            await fakeAPI.loadCategories()
         }
      }
   }
   
   
}
#Preview {
   ContentView()
}



