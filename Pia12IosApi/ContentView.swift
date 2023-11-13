//
//  ContentView.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-13.
//

import SwiftUI

struct ContentView: View {
   @State var theJoke: ChunkNorrisInfo?
   @State var jokeCategories = [String]()
   @State var searchText = ""
   
   
   var body: some View {
      VStack {
         
         if theJoke != nil {
            Text(theJoke!.created_at)
            Text(theJoke!.value)
         }
         
         HStack {
            TextField("Search Joke.....",text: $searchText)
               .border(Color.black)
   
            
            Button(action: {
               Task {
                  await loadApiForSearch(jokeSearch:searchText)
               }
            }, label: {
               Text("Search")
            })
         }
         Button(action: {
            Task {
               await loadApi()
            }
         }, label: {
            Text("Random Joke")
         })
         
         List {
            ForEach(jokeCategories,id: \.self) { cat in
               Button(action: {
                  Task {
                     await  loadApiForCategory(jokeCat: cat)
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
            await loadCategories()
         }
      }
   }
   
   func loadApiForSearch(jokeSearch: String) async {
      let apiURL = URL(string: "https://api.chucknorris.io/jokes/search?query="+jokeSearch)!
      
      do {
         let (data, _) = try await URLSession.shared.data(from: apiURL)
         let decoder = JSONDecoder()
         if let chunkThing = try? decoder.decode(ChunckNorrisSearchresult.self, from: data) {
            
            theJoke = chunkThing.result[0]
         }
      } catch {
         print("error")
      }
   }
   
   func loadApiForCategory(jokeCat: String) async {
      let apiURL = URL(string: "https://api.chucknorris.io/jokes/random?category="+jokeCat)!
      
      do {
         let (data, _) = try await URLSession.shared.data(from: apiURL)
         let decoder = JSONDecoder()
         if let chunkThing = try? decoder.decode(ChunkNorrisInfo.self, from: data) {
            
            theJoke = chunkThing
         }
      } catch {
         print("error")
      }
   }
   
   func loadCategories() async {
      let apiURL = URL(string: "https://api.chucknorris.io/jokes/categories")!
      
      do {
         let (data, _) = try await URLSession.shared.data(from: apiURL)
         let decoder = JSONDecoder()
         if let categories = try? decoder.decode([String].self, from: data) {
            
            jokeCategories = categories
            
         }
      } catch {
         print("error")
      }
   }
   
//   func loadApiRandom() {
//      Task {
//         await loadApi(apiUrlString:"https://api.chucknorris.io/jokes/random")
//      }
//   }
   func loadApi() async {
      let apiURL = URL(string: "https://api.chucknorris.io/jokes/random")!
      
      do {
         let (data, _) = try await URLSession.shared.data(from: apiURL)
         let decoder = JSONDecoder()
         if let chunkThing = try? decoder.decode(ChunkNorrisInfo.self, from: data) {
            
            theJoke = chunkThing
         }
      } catch {
         print("error")
      }
   }
   
   //   func fethcApi() async {
   ////      print("get the API")
   //
   //      let apiURL = URL(string: "https://api.chucknorris.io/jokes/random")!
   //
   //      //      do {
   //      //         let apiString = try String(contentsOf: apiURL)
   //      //
   //      //         joke  = apiString
   //      //      } catch {
   //      //
   //      //         print("error")
   //      //      }
   //
   //      do {
   //         let (data, _) = try await URLSession.shared.data(from: apiURL)
   //         let decoder = JSONDecoder()
   //         if let chunkThing = try? decoder.decode(ChunkNorris.self, from: data) {
   //
   ////            print(chunkThing.value)
   ////            theJoke = chunkThing.value
   //         }
   //
   //      } catch {
   //         print("error")
   //      }
   //
   //   }
}
#Preview {
   ContentView()
}


struct ChunkNorrisInfo: Decodable {
   var id: String
   var created_at: String
   var icon_url: String
   var updated_at: String
   var value: String
}

struct ChunckNorrisSearchresult: Decodable {
   var total: Int
   var result: [ChunkNorrisInfo]
}
