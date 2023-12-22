//
//  Bundle+Extention.swift
//  NavigationSplitView
//
//  Created by yusufyakuf on 2023-12-22.
//

import Foundation
//Bundle extention allow me to easily decode the data

extension Bundle {
   func decode<T: Decodable>(_ type: T.Type,
                             from file: String,
                             dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                             keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
      guard let url = self.url(forResource: file, withExtension: nil) else {
         fatalError("Error: Failed to locate \(file) in bundle.")
      }
      guard let data = try? Data(contentsOf: url) else {
         fatalError("Error: Failed to load \(file) from bundle.")
      }
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = dateDecodingStrategy
      decoder.keyDecodingStrategy = keyDecodingStrategy
      
      guard let loaded = try? decoder.decode(T.self, from: data) else {
         fatalError("Error: Failed to decode \(file) from bundle.")
      }
      return loaded
   }
}
