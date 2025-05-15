//
//  Day60_JsonSwiftData_PrototypeApp.swift
//  Day60-JsonSwiftData-Prototype
//
//  Created by Robert Estrada on 5/14/25.
//

import SwiftUI

@main
struct Day60_JsonSwiftData_PrototypeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [UserModel.self, FriendModel.self])
    }
}
