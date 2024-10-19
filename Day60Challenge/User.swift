//
//  User.swift
//  Day60Challenge
//
//  Created by Даниил Сивожелезов on 18.10.2024.
//

import Foundation

struct User: Codable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Hashable {
    let id: String
    let name: String
}
