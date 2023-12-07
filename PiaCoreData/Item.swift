//
//  Item.swift
//  PiaCoreData
//
//  Created by yusufyakuf on 2023-12-07.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
