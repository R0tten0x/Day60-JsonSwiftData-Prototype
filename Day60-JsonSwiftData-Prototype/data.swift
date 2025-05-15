//
//  data.swift
//  Day60-JsonSwiftData
//
//  Created by Robert Estrada on 5/14/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class UserModel {
    @Attribute(.unique) var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var tags: [String]
    var registered: Date
    var friends: [FriendModel]

    init(id: UUID, isActive: Bool, name: String, age: Int, company: String, email: String, tags: [String], registered: Date, friends: [FriendModel]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.tags = tags
        self.registered = registered
        self.friends = friends
    }
    
}

@Model
class FriendModel {
    @Attribute(.unique) var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
