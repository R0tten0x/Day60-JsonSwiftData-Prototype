//
//  DetailView.swift
//  Day60-JsonSwiftData-Prototype
//
//  Created by Robert Estrada on 5/14/25.
//

import SwiftUI

struct DetailView: View {
    let user: UserModel
    @State private var isOn: Bool?
    let mockFriends = [
        FriendData(id: UUID(), name: "Taylor"),
        FriendData(id: UUID(), name: "Bob Smith")
    ]
    
    var body: some View {
        NavigationStack {
            ForEach(0..<12) { i in
                Spacer()
            }
                ScrollView {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                        Text(user.name)
                            .font(.title)
                            .fontWeight(.black)
                        Divider()
                            .frame(height: 2)
                            .background(Color.gray)
                        
                        Text("**About:** \(user.about)")
                        Divider()

                        Text("**Age:** \(user.age)")
                        Divider()

                        Text("**Address:** \(user.address)")
                        Divider()

                        Text("**Email:** \(user.email)")
                        Divider()

                        
                        Text("**Registered:** \(user.registered)")
                        Divider()

                        
                        Text("**Company:** \(user.company)")
                        Divider()

                        
                        Text("**Friends:**")
                            
                        ForEach(user.friends) { friend in
                            Text(friend.name)
                        }
                    }
                    .padding(10)
                    
                    
                }
                .navigationTitle(user.name)
                .navigationBarTitleDisplayMode(.inline)
                .frame(width: 360, height: 675)
                .background(.ultraThickMaterial)
                .cornerRadius(20)
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .padding(5)
                .toolbar {
                    Text("\(user.isActive ? "Active" : "Inactive")")
                        .foregroundColor(user.isActive ? .green : .red)
                        .fontWeight(.black)
                }
                
                
                ForEach (0..<10) { i in
                    
                    Spacer()
                }
              
                Spacer()
                Spacer()
                Spacer()
            }
        
        }
    
}


#Preview {
        let mockFriend = FriendModel(id: UUID(), name: "Jane Doe")
        let mockUser = UserModel(
            id: UUID(),
            isActive: true,
            name: "Mock User",
            age: 35,
            company: "Mock Corp",
            email: "mock@example.com",
            address: "123 Mock St",
            about: "This is a mock about section.",
            registered: Date(),
            tags: ["Sample", "Test"],
            friends: [mockFriend]
        )
        
        return DetailView(user: mockUser)
            .modelContainer(for: [UserModel.self, FriendModel.self])
    }
