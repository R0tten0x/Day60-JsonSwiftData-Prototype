//
//  ActiveUsers.swift
//  Day60-JsonSwiftData-Prototype
//
//  Created by Robert Estrada on 5/14/25.
//

import SwiftUI

struct ActiveUsers: View {
    let activeUsers: [UserData]
       
    var body: some View {
        NavigationStack {
            VStack {
                List(activeUsers) { active in
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                        
                    }
                    
                }
            }
        }
        
        
    }
}

#Preview {
    ActiveUsers(activeUsers: [UserData]())
}
