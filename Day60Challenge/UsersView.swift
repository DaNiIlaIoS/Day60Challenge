//
//  UsersView.swift
//  Day60Challenge
//
//  Created by Даниил Сивожелезов on 19.10.2024.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]
    
    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                }
            }
            .onDelete(perform: deleteUser)
        }
        .task {
            if users.isEmpty {
                await getUsers()
            }
        }
    }
    
    init(showOnlyActive: Bool) {
        if showOnlyActive {
            _users = Query(filter: #Predicate<User> { user in
                user.isActive == true
            }, sort: \.name)
        } else {
            _users = Query(sort: \.name)
        }
    }
    
    func getUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
            decodedUsers.forEach { user in
                modelContext.insert(user)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteUser(at offsets: IndexSet) {
        for offset in offsets {
            let user = users[offset]
            modelContext.delete(user)
        }
    }
}

#Preview {
    UsersView(showOnlyActive: true)
}
