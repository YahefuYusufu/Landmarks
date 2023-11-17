//
//  Model.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-16.
//

import Foundation

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
