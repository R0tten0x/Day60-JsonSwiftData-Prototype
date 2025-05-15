//
//  data.swift
//  Day60-JsonSwiftData
//
//  Created by Robert Estrada on 5/14/25.
//

import Foundation
import SwiftUI
import SwiftData


// JSON
//struct UserData: Codable, Identifiable {
//    var id = UUID()
//    var isActive = false
//    var name = ""
//    var age = 1
//    var company = ""
//    var email = ""
//    var address = ""
//    var about = ""
//    var registered = Date()
//    var tags = [""]
//}
//
//struct FriendData: Codable, Identifiable {
//    var id = UUID()
//    var name = ""
//}
//
//
//func fetchData() {
//    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//        print("Invalid URL")
//        return
//    }
//    
//    let session = URLSession(configuration: .default)
//    let task = session.dataTask(with: url) { data, _, error in
//        
//        let decoder = JSONDecoder()
//        
//        do {
//            if let data = data {
//                let users = try decoder.decode([UserData].self, from: data)
//                print(users)
//            }
//        } catch {
//            print("Failed to decode: \(error)")
//        }
//        
//    }
//    
//}
//

