//
//  DetailView.swift
//  Day60-JsonSwiftData-Prototype
//
//  Created by Robert Estrada on 5/14/25.
//

import SwiftUI

struct DetailView: View {
    let user: UserData
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
                        Text("About")
                            .font(.headline)
                        Text(user.about)
                        Divider()

                        Text("Age")
                            .font(.headline)
                        Text("\(user.age) years old")
                        Divider()

                        Text("Address")
                            .font(.headline)
                        Text("\(user.address)")
                        Divider()

                        
                        
                        Text("Email")
                            .font(.headline)
                        Text("\(user.email)")
                        Divider()

                        
                        Text("Registered")
                            .font(.headline)
                        Text("\(user.registered)")
                        Divider()

                        
                        Text("Company")
                            .font(.headline)
                        Text("\(user.company)")
                        Divider()

                        
                        Text("Friends")
                            .font(.headline)
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
                        .foregroundColor(user.isActive ?? false ? .green : .red)
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
    DetailView(user: UserData(
        id: UUID(),
        isActive: true,
        name: "Preview User",
        age: 30,
        company: "Preview Corp",
        email: "preview@example.com",
        address: "123 Preview Lane",
        about: "This is a mock user for previews.",
        registered: Date(),
        tags: ["Swift", "UI"],
        friends: [
            FriendData(id: UUID(), name: "Jane Doe"),
            FriendData(id: UUID(), name: "John Smith")
        ]
    ))
}
