

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
