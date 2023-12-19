//
//  ContentView.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-13.
//

import SwiftUI

struct ContentView: View {
   @StateObject var APIStuff = ChunkAPI()
   @State var searchText = ""
   @State var showJoke = false
   
   var body: some View {
      ZStack {
         VStack {
            VStack {
               if APIStuff.theJoke != nil {
                  Text(ChunkHelper().fixDate(indate: APIStuff.theJoke!.created_at))
                  Text(APIStuff.theJoke!.value)
                  
                  Button(action: {
                     showJoke = true
                  }, label: {
                     Text("The Joke")
                  })
                  .sheet(isPresented: $showJoke, content: {
                     ShowJokeView(bigAPI: APIStuff)
                  })
               }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200.0)
            .background(Color.blue)
            
            if APIStuff.errorMessage != "" {
               VStack {
                  Text(APIStuff.errorMessage)
                     .foregroundStyle(Color.white)
               }
               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
               .frame(height: 100.0)
               .background(Color.red)
            }
            
            HStack {
               TextField("Search Joke ...",text:$searchText)
                  .onChange(of: searchText) { oldValue, newValue in
                     print("Changing from \(oldValue) to \(newValue)")
                  }
               Button(action: {
                  APIStuff.loadApiForSearch(jokeSearch: searchText)
               }, label: {
                  Text("Search")
               })
            }
            
            Button(action: {
               APIStuff.loadApiRandom()
            }, label: {
               Text("Random Joke")
            })
            
            List {
               ForEach(APIStuff.jokeCategories, id: \.self) { cat in
                  VStack {
                     Text(cat)
                  }
                  .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                  .frame(height: 80)
                  .onTapGesture {
                     APIStuff.loadAPIForCategory(jokeCat: cat)
                  }
               }
            }
         }
         .padding()
         
         if APIStuff.isLoading {
            VStack {
               Text("Loading...")
               ProgressView()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(maxHeight: .infinity)
            .background(Color.gray)
            .opacity(0.5)
         }
      }
      .onAppear() {
         APIStuff.loadCategories()
      }
      .onChange(of: APIStuff.isLoading) { oldValue, newValue in
         if(APIStuff.isLoading) {
            print("Nu Ladda")
         } else {
            print("Inte Ladda Mer")
         }
      }
   }
}
#Preview {
   ContentView()
}




