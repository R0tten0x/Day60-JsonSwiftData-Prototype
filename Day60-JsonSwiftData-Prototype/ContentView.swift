//
//  ContentView.swift
//  Day60-JsonSwiftData
//
//  Created by Robert Estrada on 5/14/25.
//

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
    @State private var uData: [UserData] = []

    var body: some View {
        
        
        NavigationStack {
            ZStack {
                VStack {
                    
                    List(uData) { user in
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
                .navigationTitle("Current Users")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: fetchData)
            }
        }
      
    }
// JSON Decoder,
    func fetchData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601 // <-- use when weird date formattting.

            
            do {
                if let data = data {
                    let users = try decoder.decode([UserData].self, from: data)
                    print(users)
                    DispatchQueue.main.async {
                        self.uData = users
                    }
                }
            } catch {
                print("Failed to decode: \(error)")
            }
        }
        .resume()
    }
}

#Preview {
    ContentView()
}
