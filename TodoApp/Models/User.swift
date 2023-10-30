//
//  User.swift
//  TodoApp
//
//  Created by yusufyakuf on 2023-10-28.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
