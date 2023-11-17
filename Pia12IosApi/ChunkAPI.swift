//
//  ChunkAPI.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-16.
//

import SwiftUI

class ChunkAPI: ObservableObject  {
   @Published var theJoke: ChunkNorrisInfo?
   @Published var jokeCategories = [String]()
   @Published var isLoading = false
   @Published var errorMessage = ""
   
   
   
   func loadApi(apiURLString:String) async {
      if ChunkHelper().isPreview {
         theJoke = ChunkNorrisInfo(id: "aaa", created_at: "xxx",  value: "Joke Joke Joke")
         return
      }
      
      DispatchQueue.main.async {
         self.errorMessage = ""
      }
      
      let apiURL = URL(string: apiURLString)!
      
      do {
         DispatchQueue.main.async {
            self.isLoading = true
         }
         let (data, _) = try await URLSession.shared.data(from: apiURL)
         let decoder = JSONDecoder()
         if let chunkThing = try? decoder.decode(ChunkNorrisInfo.self, from: data) {
            DispatchQueue.main.async {
               self.theJoke = chunkThing
            }
         }
         if let chunkThing = try? decoder.decode(ChunckNorrisSearchresult.self, from: data) {
            if chunkThing.result.count > 0 {
               DispatchQueue.main.async {
                  self.theJoke = chunkThing.result[0]
               }
            } else {
               DispatchQueue.main.async {
                  self.errorMessage = "Nothing found!"
               }
            }
         }
         DispatchQueue.main.async {
            self.isLoading = false
         }
      } catch {
         print("error")
      }
   }
   
   func loadCategories()  {
      Task {
         if ChunkHelper().isPreview {
            jokeCategories = ["A","B","C"]
            return
         }
         let apiURL = URL(string: "https://api.chucknorris.io/jokes/categories")!
         
         DispatchQueue.main.async {
            self.isLoading = true
         }
         
         do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            let decoder = JSONDecoder()
            
            DispatchQueue.main.async {
               if let categories = try? decoder.decode([String].self, from: data) {
                  
                  self.jokeCategories = categories
               }
               self.isLoading = false
            }
         } catch {
            print("error")
         }
         
      }
   }
   //loadAPIForCategory
   func loadAPIForCategory(jokeCat: String)   {
      Task {
         await loadApi(apiURLString:"https://api.chucknorris.io/jokes/random?category="+jokeCat)
      }
   }
   
   //loadApiForSearch
   func loadApiForSearch(jokeSearch: String)   {
      Task {
         await loadApi(apiURLString:"https://api.chucknorris.io/jokes/search?query="+jokeSearch)
      }
   }
   
   //loadApiRandom
   func loadApiRandom() {
      Task {
         await loadApi(apiURLString:"https://api.chucknorris.io/jokes/random")
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


