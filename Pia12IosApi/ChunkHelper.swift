//
//  ChunkHelper.swift
//  Pia12IosApi
//
//  Created by yusufyakuf on 2023-11-17.
//

import Foundation

class ChunkHelper {
   var isPreview: Bool {
      return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
   }
   
   func fixDate(indate: String) -> String {
      // 2020-01-05 13:42:19.104863
      
      let dateFormat = DateFormatter()
      dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ssssss"
      
      _ = dateFormat.date(from: indate)
      
      return "17/12 2023"
   }
}
