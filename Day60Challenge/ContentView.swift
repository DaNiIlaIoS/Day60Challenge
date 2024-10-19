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
    
    @State private var showOnlyActive = false
    
    var body: some View {
        NavigationStack {
            UsersView(showOnlyActive: showOnlyActive)
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(showOnlyActive ? "Show All Users" : "Show Active Users") {
                        showOnlyActive.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
