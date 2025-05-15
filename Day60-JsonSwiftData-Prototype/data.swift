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
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [FriendModel] = []

    init(id: UUID, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [FriendModel]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
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

