//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Даниил Сивожелезов on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
            List {
                ForEach(users, id: \.id) { user in
                    Text(user.name)
                }
            }
        .task {
            await getUsers()
        }
    }
    
    func getUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode([User].self, from: data) {
                users = decoder
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
