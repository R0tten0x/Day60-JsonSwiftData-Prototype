

import SwiftUI
import SwiftData

struct UserData: Codable, Identifiable {
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
    var friends: [FriendData]
}

struct FriendData: Codable, Identifiable {
    var id: UUID
    var name: String
}



struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \UserModel.name) var usersData: [UserModel]
    @State private var uData: [UserData] = []
    @State private var isLoading = false
    


    var body: some View {
        
        
        NavigationStack {
                VStack {
                    
                    if isLoading {
                                       ProgressView("Loading users...")
                                   } else if usersData.isEmpty {
                                       Text("No Users Loaded Yet")
                                           .foregroundColor(.gray)
                                   } else {
                                       List(usersData) { user in
                                           NavigationLink(destination: DetailView(user: user)) {
                                               VStack(alignment: .leading) {
                                                   Text(user.name)
                                                       .font(.headline)
                                                   Text("\(user.isActive ? "Active" : "Inactive")")
                                                       .foregroundColor(user.isActive ? .green : .red)
                                                       .font(.caption)
                                               }
                            }
                        }
                    }
                }
                .navigationTitle("Current Users")
                .onAppear {
                    if usersData.isEmpty {
                        isLoading = true
                        fetchData()
                    }
                }
                .toolbar {
                    Button("Refresh Data") {
                        isLoading = true
                        try? deleteAllExistingData()
                        fetchData()
                    }
                }
        }
      
    }
// JSON Decoder,
    func fetchData() {
        if !usersData.isEmpty {
            isLoading = false
            return
        }
        
        isLoading = true
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            isLoading = false
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            guard let data = data else {
                print("No data received")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let users = try decoder.decode([UserData].self, from: data)
                
                DispatchQueue.main.async {
                    self.uData = users
                    
                    // IMPORTANT: Delete all existing data first
                    do {
                        try self.deleteAllExistingData()
                    } catch {
                        print("Failed to delete existing data: \(error.localizedDescription)")
                    }
                    
                    // Now add new data
                    for user in users {
                        let friendModels = user.friends.map { FriendModel(id: $0.id, name: $0.name) }
                        
                        let userModel = UserModel(
                            id: user.id,
                            isActive: user.isActive,
                            name: user.name,
                            age: user.age,
                            company: user.company,
                            email: user.email,
                            address: user.address,
                            about: user.about,
                            registered: user.registered,
                            tags: user.tags,
                            friends: friendModels
                        )
                        
                        self.modelContext.insert(userModel)
                    }
                    
                    // Save once after all inserts
                    do {
                        try self.modelContext.save()
                        print("Saved \(users.count) users successfully")
                    } catch {
                        print("Failed To Save SwiftData: \(error.localizedDescription)")
                    }
                    
                    self.isLoading = false
                }
            } catch {
                print("Failed to decode: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }

    // Helper method to delete all existing data
    func deleteAllExistingData() throws {
        try modelContext.delete(model: UserModel.self, where: #Predicate { _ in true })
        try modelContext.delete(model: FriendModel.self, where: #Predicate { _ in true })
    }
    
   

}

#Preview {
    ContentView()
        .modelContainer(for: [UserModel.self, FriendModel.self])
}
