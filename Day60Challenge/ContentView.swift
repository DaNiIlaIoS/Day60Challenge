//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Даниил Сивожелезов on 18.10.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]
    //    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
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
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .task {
                if users.isEmpty {
                    await getUsers()
                }
            }
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
}

#Preview {
    ContentView()
}
